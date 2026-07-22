import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/customers/data/repo/customer_repository.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/cubit/sales_invoice_form_state.dart';
import 'package:pharmacy_app/features/sales_invoices/data/repo/sales_invoice_repository.dart';

/// Result of resolving a scanned barcode into a line item, for the form to
/// surface as UI (success / not-found / error). The cubit stays UI-free; the
/// screen localizes the [Failure] via `failure.localizedMessage(context)`.
sealed class ScannedProductResult {
  const ScannedProductResult();
  const factory ScannedProductResult.added(ProductCardModel product) =
      ScannedAdded;
  const factory ScannedProductResult.notFound() = ScannedNotFound;
  const factory ScannedProductResult.error(Failure failure) = ScannedError;
}

class ScannedAdded extends ScannedProductResult {
  const ScannedAdded(this.product);
  final ProductCardModel product;
}

class ScannedNotFound extends ScannedProductResult {
  const ScannedNotFound();
}

class ScannedError extends ScannedProductResult {
  const ScannedError(this.failure);
  final Failure failure;
}

/// Drives the New Sale form. Loads the customer + product dropdown options and
/// owns the dynamic line-items list. `submit()` builds the snake_case body and
/// POSTs it; the date + payment method + amount_paid + due_date + notes live in
/// controllers in the form widget (passed into `submit`).
class SalesInvoiceFormCubit extends Cubit<SalesInvoiceFormState> {
  SalesInvoiceFormCubit({
    required this.invoiceRepository,
    required this.customerRepository,
    required this.inventoryRepository,
  }) : super(const SalesInvoiceFormState());

  final SalesInvoiceRepository invoiceRepository;
  final CustomerRepository customerRepository;
  final InventoryRepository inventoryRepository;

  bool _seeded = false;

  // ---- Options ---------------------------------------------------------- //

  Future<void> loadOptions() async {
    if (isClosed) return;
    emit(
      state.copyWith(
        isOptionsLoading: true,
        hasOptionsError: false,
        optionsFailure: null,
      ),
    );
    final customersResult = await customerRepository.fetchCustomers(
      perPage: 200,
    );
    final productsResult = await inventoryRepository.fetchProducts(
      page: 1,
      perPage: 200,
    );
    if (isClosed) return;

    if (customersResult.isLeft() || productsResult.isLeft()) {
      Failure? failure;
      customersResult.fold((f) => failure = f, (_) {});
      productsResult.fold((f) => failure ??= f, (_) {});
      emit(
        state.copyWith(
          isOptionsLoading: false,
          hasOptionsError: true,
          optionsFailure: failure,
        ),
      );
      return;
    }

    final customers =
        customersResult.fold((_) => <CustomerModel>[], (p) => p.customers);
    final products =
        productsResult.fold((_) => <ProductCardModel>[], (p) => p.products);
    emit(
      state.copyWith(
        isOptionsLoading: false,
        hasOptionsError: false,
        optionsFailure: null,
        customers: customers,
        products: products,
      ),
    );
  }

  Future<void> reloadOptions() => loadOptions();

  void selectCustomer(CustomerModel? customer) =>
      emit(state.copyWith(selectedCustomer: customer));

  // ---- Line items -------------------------------------------------------- //

  void addItem() {
    emit(
      state.copyWith(
        items: [...state.items, const SalesInvoiceItemInput()],
      ),
    );
  }

  void updateItem(int index, SalesInvoiceItemInput updated) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items];
    items[index] = updated;
    emit(state.copyWith(items: items));
  }

  /// Selects a product for a line item and pre-fills the selling price from
  /// the product's stored selling price (a small nicety the purchase form
  /// lacks) — the cashier can still override it.
  void setItemProduct(int index, ProductCardModel? product) {
    if (index < 0 || index >= state.items.length) return;
    final current = state.items[index];
    // Only pre-fill when the line has no selling price yet, so we don't
    // clobber a value the cashier already typed.
    final prefilled = product != null && current.sellingPrice.trim().isEmpty
        ? product.price.toStringAsFixed(2)
        : current.sellingPrice;
    updateItem(
      index,
      current.copyWith(product: product, sellingPrice: prefilled),
    );
  }

  // ---- Barcode seed / scan --------------------------------------------- //

  /// Seeds the form with a single product (from a dashboard scan). Idempotent
  /// — only the first call appends an item; later calls are no-ops so a
  /// rebuilt subtree (e.g. on hot reload) doesn't double-add.
  void seedProduct(ProductDetailModel detail) {
    if (isClosed || _seeded) return;
    _seeded = true;
    _applyScannedProduct(detail.toProductCard());
  }

  /// Looks up the scanned barcode and replaces the product on the row at
  /// [targetIndex] when a product matches; appends a new row only when no
  /// target row is given (the dashboard-seed path). Returns a
  /// [ScannedProductResult] for the screen to surface (not-found / error
  /// snackbars); the cubit never touches BuildContext.
  Future<ScannedProductResult> addScannedItem(
    String barcode, {
    int? targetIndex,
  }) async {
    if (isClosed) return const ScannedProductResult.notFound();
    emit(state.copyWith(isScanning: true));
    final result = await inventoryRepository.lookupByBarcode(barcode);
    if (isClosed) return const ScannedProductResult.notFound();
    emit(state.copyWith(isScanning: false));
    return result.fold(
      (failure) => ScannedProductResult.error(failure),
      (detail) {
        if (detail == null) return const ScannedProductResult.notFound();
        final card = detail.toProductCard();
        _applyScannedProduct(card, targetIndex: targetIndex);
        return ScannedProductResult.added(card);
      },
    );
  }

  /// Replaces the product on [targetIndex] when it's a valid row (whether or
  /// not that row already had a product), else appends a new item. Reuses
  /// [setItemProduct]'s selling-price pre-fill nicety.
  void _applyScannedProduct(
    ProductCardModel product, {
    int? targetIndex,
  }) {
    final items = [...state.items];
    if (targetIndex != null &&
        targetIndex >= 0 &&
        targetIndex < items.length) {
      // Preserve any quantity/tax/discount the user already typed; only swap
      // the product (and re-seed the selling price to the product's stored
      // price, matching the manual setItemProduct nicety).
      final current = items[targetIndex];
      items[targetIndex] = SalesInvoiceItemInput(
        product: product,
        quantity: current.quantity,
        sellingPrice: current.sellingPrice.trim().isEmpty
            ? product.price.toStringAsFixed(2)
            : current.sellingPrice,
        tax: current.tax,
        discount: current.discount,
      );
      emit(state.copyWith(items: items));
      return;
    }
    final item = SalesInvoiceItemInput(
      product: product,
      // Pre-fill selling price from the product — matches setItemProduct's
      // nicety, since a scanned item always starts with an empty price.
      sellingPrice: product.price.toStringAsFixed(2),
    );
    emit(state.copyWith(items: [...items, item]));
  }

  void removeItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items]..removeAt(index);
    emit(state.copyWith(items: items));
  }

  // ---- Totals (client-side preview) ------------------------------------- //

  double get computedSubtotal => state.items.fold(
        0,
        (sum, i) => sum + (_num(i.sellingPrice) * _num(i.quantity)),
      );

  double get computedTaxTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.tax));

  double get computedDiscountTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.discount));

  double get computedGrandTotal =>
      computedSubtotal + computedTaxTotal - computedDiscountTotal;

  // ---- Submit ------------------------------------------------------------ //

  /// Builds and POSTs the sales-invoice body. [invoiceDate] is `Y-m-d`,
  /// [paymentMethod] is the chosen enum, [amountPaid] is the raw string
  /// (validated by the caller), [dueDate] + [notes] are optional.
  Future<void> submit({
    required String invoiceDate,
    required InvoicePaymentMethod paymentMethod,
    required String amountPaid,
    String? dueDate,
    String? notes,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));

    final itemsJson = <Map<String, dynamic>>[];
    for (final i in state.items) {
      itemsJson.add(<String, dynamic>{
        'product_id': i.product?.id,
        'quantity': int.tryParse(i.quantity.trim()) ?? 0,
        'selling_price': _num(i.sellingPrice),
        if (i.tax.trim().isNotEmpty) 'tax': _num(i.tax),
        if (i.discount.trim().isNotEmpty) 'discount': _num(i.discount),
      });
    }

    final body = <String, dynamic>{
      'customer_id': state.selectedCustomer?.id,
      'invoice_date': invoiceDate,
      'payment_method': paymentMethod.name,
      'amount_paid': _num(amountPaid),
      if (dueDate != null && dueDate.trim().isNotEmpty)
        'due_date': dueDate.trim(),
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      'items': itemsJson,
    };

    final result = await invoiceRepository.createSalesInvoice(body);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isSaving: false, failure: failure)),
      (_) => emit(state.copyWith(isSaving: false, saved: true)),
    );
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) emit(state.copyWith(failure: null));
  }

  void clearOptionsFailure() {
    if (isClosed) return;
    if (state.optionsFailure != null) {
      emit(state.copyWith(optionsFailure: null));
    }
  }

  double _num(String s) => double.tryParse(s.trim()) ?? 0;
}
