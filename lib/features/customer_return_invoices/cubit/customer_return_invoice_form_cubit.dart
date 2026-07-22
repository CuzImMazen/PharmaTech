import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/customers/data/repo/customer_repository.dart';
import 'package:pharmacy_app/features/customer_return_invoices/cubit/customer_return_invoice_form_state.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/repo/customer_return_invoice_repository.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';

/// Result of resolving a scanned barcode into a line item, for the form to
/// surface as UI (success / not-found / error). The cubit stays UI-free; the
/// screen localizes the [Failure] via `failure.localizedMessage(context)`.
sealed class ScannedReturnProductResult {
  const ScannedReturnProductResult();
  const factory ScannedReturnProductResult.added(ProductCardModel product) =
      ScannedReturnAdded;
  const factory ScannedReturnProductResult.notFound() = ScannedReturnNotFound;
  const factory ScannedReturnProductResult.notAllowed() =
      ScannedReturnNotAllowed;
  const factory ScannedReturnProductResult.error(Failure failure) =
      ScannedReturnError;
}

class ScannedReturnAdded extends ScannedReturnProductResult {
  const ScannedReturnAdded(this.product);
  final ProductCardModel product;
}

class ScannedReturnNotFound extends ScannedReturnProductResult {
  const ScannedReturnNotFound();
}

class ScannedReturnNotAllowed extends ScannedReturnProductResult {
  const ScannedReturnNotAllowed();
}

class ScannedReturnError extends ScannedReturnProductResult {
  const ScannedReturnError(this.failure);
  final Failure failure;
}

/// Drives the New Customer Return form. Loads the customer + product dropdown
/// options and owns the dynamic line-items list. `submit()` builds the
/// snake_case body and POSTs it; the date + refund method + reason + notes live
/// in controllers in the form widget (passed into `submit`). Mirrors
/// [SalesInvoiceFormCubit] and reuses its barcode scan + apply pattern.
class CustomerReturnInvoiceFormCubit
    extends Cubit<CustomerReturnInvoiceFormState> {
  CustomerReturnInvoiceFormCubit({
    required this.returnRepository,
    required this.customerRepository,
    required this.inventoryRepository,
  }) : super(const CustomerReturnInvoiceFormState());

  final CustomerReturnInvoiceRepository returnRepository;
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

    final autoFilledItems = _autoFillSeededItems(state.items, products);

    emit(
      state.copyWith(
        isOptionsLoading: false,
        hasOptionsError: false,
        optionsFailure: null,
        customers: customers,
        products: products,
        items: autoFilledItems,
      ),
    );
  }

  /// Matches seeded rows that only have an [originalProductId] (because the
  /// dropdown was still loading) to their real [ProductCardModel] now that
  /// options are available.
  List<CustomerReturnItemInput> _autoFillSeededItems(
    List<CustomerReturnItemInput> items,
    List<ProductCardModel> products,
  ) {
    if (items.every((i) => i.product != null || i.originalProductId == null)) {
      return items;
    }
    final byId = <int, ProductCardModel>{
      for (final p in products) p.id: p,
    };
    return items.map((item) {
      if (item.product != null || item.originalProductId == null) return item;
      final match = byId[item.originalProductId];
      if (match == null) return item;
      return item.copyWith(product: match);
    }).toList();
  }

  Future<void> reloadOptions() => loadOptions();

  void selectCustomer(CustomerModel? customer) =>
      emit(state.copyWith(selectedCustomer: customer));

  // ---- Line items -------------------------------------------------------- //

  void addItem() {
    emit(
      state.copyWith(
        items: [...state.items, const CustomerReturnItemInput()],
      ),
    );
  }

  void updateItem(int index, CustomerReturnItemInput updated) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items];
    items[index] = updated;
    emit(state.copyWith(items: items));
  }

  /// Selects a product for a line item and pre-fills the unit price from the
  /// product's stored selling price — the cashier can still override it.
  ///
  /// If the selected product already appears in another row, the change is
  /// rejected so the same product can't be returned twice in one invoice.
  void setItemProduct(int index, ProductCardModel? product) {
    if (index < 0 || index >= state.items.length) return;
    if (product != null) {
      final productId = product.id;
      final alreadyUsed = state.items.indexed.any(
        (entry) => entry.$1 != index && entry.$2.product?.id == productId,
      );
      if (alreadyUsed) return;
    }
    final current = state.items[index];
    // Only pre-fill when the line has no unit price yet, so we don't clobber a
    // value the user already typed.
    final prefilled = product != null && current.unitPrice.trim().isEmpty
        ? product.price.toStringAsFixed(2)
        : current.unitPrice;
    updateItem(
      index,
      current.copyWith(product: product, unitPrice: prefilled),
    );
  }

  /// Whether every product allowed on a seeded return is already assigned to a
  /// row, so the "Add item" button can be disabled.
  bool get allAllowedProductsUsed {
    final allowed = state.allowedProductIds;
    if (allowed.isEmpty) return false;
    final usedProductIds = state.items
        .where((i) => i.product != null)
        .map((i) => i.product!.id)
        .toSet();
    return allowed.difference(usedProductIds).isEmpty;
  }

  // ---- Sales-invoice seed ---------------------------------------------- //

  /// Pre-fills the return form from a completed sales invoice: the customer,
  /// the `original_sales_invoice_id`, and one line item per sale item
  /// (quantity = the original sold qty, unit price = the sale's selling
  /// price). Idempotent — only the first call seeds; later calls are no-ops.
  void seedFromSalesInvoice(SalesInvoiceModel invoice) {
    if (isClosed || _seeded) return;
    _seeded = true;
    final invoiceItems = invoice.items ?? <SalesInvoiceItemModel>[];
    final allowedProductIds = <int>{
      for (final saleItem in invoiceItems) saleItem.productId,
    };
    final originalQuantities = <int, int>{
      for (final saleItem in invoiceItems) saleItem.productId: saleItem.quantity,
    };
    final items = <CustomerReturnItemInput>[
      for (final saleItem in invoiceItems)
        CustomerReturnItemInput(
          product: null,
          originalProductId: saleItem.productId,
          quantity: saleItem.quantity.toString(),
          unitPrice: saleItem.sellingPrice.toStringAsFixed(2),
          tax: saleItem.tax == 0 ? '' : saleItem.tax.toStringAsFixed(2),
          discount:
              saleItem.discount == 0 ? '' : saleItem.discount.toStringAsFixed(2),
        ),
    ];
    emit(
      state.copyWith(
        selectedCustomer: invoice.customer,
        originalSalesInvoiceId: invoice.id,
        allowedProductIds: allowedProductIds,
        originalInvoiceQuantities: originalQuantities,
        items: items,
      ),
    );
  }

  // ---- Barcode scan ----------------------------------------------------- //

  /// Whether a new product could be added before all allowed products are used.
  bool canAddProduct(int? productId) {
    final allowed = state.allowedProductIds;
    if (allowed.isEmpty) return true;
    final used = state.items
        .where((i) => i.product != null)
        .map((i) => i.product!.id)
        .toSet();
    if (productId == null) return used.length < allowed.length;
    if (used.contains(productId)) return true;
    return used.length < allowed.length;
  }

  /// Looks up the scanned barcode and replaces the product on the row at
  /// [targetIndex] when a product matches; appends a new row only when no
  /// target row is given. Returns a [ScannedReturnProductResult] for the screen
  /// to surface (not-found / error snackbars); the cubit never touches
  /// BuildContext.
  Future<ScannedReturnProductResult> addScannedItem(
    String barcode, {
    int? targetIndex,
  }) async {
    if (isClosed) return const ScannedReturnProductResult.notFound();
    emit(state.copyWith(isScanning: true));
    final result = await inventoryRepository.lookupByBarcode(barcode);
    if (isClosed) return const ScannedReturnProductResult.notFound();
    emit(state.copyWith(isScanning: false));
    return result.fold(
      (failure) => ScannedReturnProductResult.error(failure),
      (detail) {
        if (detail == null) return const ScannedReturnProductResult.notFound();
        final card = detail.toProductCard();
        if (state.allowedProductIds.isNotEmpty &&
            !state.allowedProductIds.contains(card.id)) {
          return const ScannedReturnProductResult.notAllowed();
        }
        _applyScannedProduct(card, targetIndex: targetIndex);
        return ScannedReturnProductResult.added(card);
      },
    );
  }

  /// Replaces the product on [targetIndex] when it's a valid row (whether or
  /// not that row already had a product), else appends a new item only when
  /// the allowed-product limit hasn't been reached. Reuses
  /// [setItemProduct]'s unit-price pre-fill nicety.
  void _applyScannedProduct(
    ProductCardModel product, {
    int? targetIndex,
  }) {
    final items = [...state.items];
    if (targetIndex != null &&
        targetIndex >= 0 &&
        targetIndex < items.length) {
      // Preserve any quantity/tax/discount the user already typed; only swap
      // the product (and re-seed the unit price to the product's stored
      // price, matching the manual setItemProduct nicety).
      final current = items[targetIndex];
      items[targetIndex] = CustomerReturnItemInput(
        product: product,
        quantity: current.quantity,
        unitPrice: current.unitPrice.trim().isEmpty
            ? product.price.toStringAsFixed(2)
            : current.unitPrice,
        tax: current.tax,
        discount: current.discount,
      );
      emit(state.copyWith(items: items));
      return;
    }
    final item = CustomerReturnItemInput(
      product: product,
      // Pre-fill unit price from the product — matches setItemProduct's
      // nicety, since a scanned item always starts with an empty price.
      unitPrice: product.price.toStringAsFixed(2),
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
        (sum, i) => sum + (_num(i.unitPrice) * _num(i.quantity)),
      );

  double get computedTaxTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.tax));

  double get computedDiscountTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.discount));

  /// refund_total = subtotal + tax − discount.
  double get computedRefundTotal =>
      computedSubtotal + computedTaxTotal - computedDiscountTotal;

  // ---- Submit ------------------------------------------------------------ //

  /// Builds and POSTs the customer-return body. [invoiceDate] is `Y-m-d`,
  /// [refundMethod] is the chosen enum, [reason] + [notes] are optional.
  Future<void> submit({
    required String invoiceDate,
    required ReturnRefundMethod refundMethod,
    String? reason,
    String? notes,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));

    final originalQtyByProductId = <int, int>{};
    final itemsJson = <Map<String, dynamic>>[];
    for (final i in state.items) {
      final productId = i.product?.id;
      final returnQty = int.tryParse(i.quantity.trim()) ?? 0;
      if (productId != null && state.originalSalesInvoiceId != null) {
        final preceding = originalQtyByProductId[productId] ?? 0;
        final original = state.originalInvoiceQuantities[productId];
        if (original != null && preceding + returnQty > original) {
          emit(
            state.copyWith(
              isSaving: false,
              failure: const ValidationFailure(
                message: 'Return quantity exceeds original invoice quantity',
                errors: {},
              ),
            ),
          );
          return;
        }
        originalQtyByProductId[productId] = preceding + returnQty;
      }
      itemsJson.add(<String, dynamic>{
        'product_id': productId,
        'quantity': returnQty,
        'unit_price': _num(i.unitPrice),
        if (i.tax.trim().isNotEmpty) 'tax': _num(i.tax),
        if (i.discount.trim().isNotEmpty) 'discount': _num(i.discount),
      });
    }

    final body = <String, dynamic>{
      if (state.selectedCustomer != null)
        'customer_id': state.selectedCustomer!.id,
      if (state.originalSalesInvoiceId != null)
        'original_sales_invoice_id': state.originalSalesInvoiceId,
      'invoice_date': invoiceDate,
      'refund_method': refundMethod.name,
      if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim(),
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      'items': itemsJson,
    };

    final result = await returnRepository.createReturn(body);
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
