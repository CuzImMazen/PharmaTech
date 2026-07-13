import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/purchase_invoices/cubit/purchase_invoice_form_state.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/repo/purchase_invoice_repository.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';
import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository.dart';

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

/// Drives the Add Purchase Invoice form. Loads the supplier + product dropdown
/// options and owns the dynamic line-items list. `submit()` builds the
/// snake_case body and POSTs it; the date + payment method + amount_paid +
/// notes live in controllers in the form widget (passed into `submit`).
class PurchaseInvoiceFormCubit extends Cubit<PurchaseInvoiceFormState> {
  PurchaseInvoiceFormCubit({
    required this.invoiceRepository,
    required this.supplierRepository,
    required this.inventoryRepository,
  }) : super(const PurchaseInvoiceFormState());

  final PurchaseInvoiceRepository invoiceRepository;
  final SupplierRepository supplierRepository;
  final InventoryRepository inventoryRepository;

  bool _seeded = false;
  // ---- Options ---------------------------------------------------------- //

  Future<void> loadOptions() async {
    if (isClosed) return;
    emit(state.copyWith(isOptionsLoading: true, hasOptionsError: false));
    final suppliersResult = await supplierRepository.fetchSuppliers(
      perPage: 200,
    );
    final productsResult = await inventoryRepository.fetchProducts(
      page: 1,
      perPage: 200,
    );
    if (isClosed) return;

    if (suppliersResult.isLeft() || productsResult.isLeft()) {
      emit(state.copyWith(isOptionsLoading: false, hasOptionsError: true));
      return;
    }

    final suppliers = suppliersResult.fold((_) => <SupplierModel>[], (p) => p.suppliers);
    final products =
        productsResult.fold((_) => <ProductCardModel>[], (p) => p.products);
    emit(
      state.copyWith(
        isOptionsLoading: false,
        hasOptionsError: false,
        suppliers: suppliers,
        products: products,
      ),
    );
  }

  Future<void> reloadOptions() => loadOptions();

  void selectSupplier(SupplierModel? supplier) =>
      emit(state.copyWith(selectedSupplier: supplier));

  // ---- Line items -------------------------------------------------------- //

  void addItem() {
    emit(
      state.copyWith(
        items: [...state.items, const PurchaseInvoiceItemInput(expanded: true)],
      ),
    );
  }

  void updateItem(int index, PurchaseInvoiceItemInput updated) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items];
    items[index] = updated;
    emit(state.copyWith(items: items));
  }

  void setItemProduct(int index, ProductCardModel? product) {
    if (index < 0 || index >= state.items.length) return;
    updateItem(index, state.items[index].copyWith(product: product));
  }

  // ---- Barcode seed / scan --------------------------------------------- //

  /// Seeds the form with a single product (from a dashboard scan). Idempotent
  /// — only the first call appends an item; later calls are no-ops so a
  /// rebuilt subtree (e.g. on hot reload) doesn't double-add.
  void seedProduct(ProductDetailModel detail) {
    if (isClosed || _seeded) return;
    _seeded = true;
    _applyScannedProduct(detail);
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
        _applyScannedProduct(detail, targetIndex: targetIndex);
        return ScannedProductResult.added(detail.toProductCard());
      },
    );
  }

  /// Replaces the product on [targetIndex] when it's a valid row (whether or
  /// not that row already had a product), else appends a new expanded item.
  /// Pre-fills the wholesale price from the detail's buying price when the
  /// row had no price yet (a nicety the manual `setItemProduct` path lacks —
  /// a freshly added batch usually restocks at the known cost price) and
  /// preserves any batch/quantity/tax/discount the user already typed.
  void _applyScannedProduct(
    ProductDetailModel detail, {
    int? targetIndex,
  }) {
    final card = detail.toProductCard();
    final items = [...state.items];
    if (targetIndex != null &&
        targetIndex >= 0 &&
        targetIndex < items.length) {
      final current = items[targetIndex];
      items[targetIndex] = PurchaseInvoiceItemInput(
        product: card,
        quantity: current.quantity,
        wholesalePrice: current.wholesalePrice.trim().isEmpty
            ? detail.buyingPrice.toStringAsFixed(2)
            : current.wholesalePrice,
        tax: current.tax,
        discount: current.discount,
        batchNumber: current.batchNumber,
        expiryDate: current.expiryDate,
        sellingPrice: current.sellingPrice,
        expanded: current.expanded,
      );
      emit(state.copyWith(items: items));
      return;
    }
    final prefilled = PurchaseInvoiceItemInput(
      product: card,
      wholesalePrice: detail.buyingPrice.toStringAsFixed(2),
      expanded: true,
    );
    emit(state.copyWith(items: [...items, prefilled]));
  }

  void toggleItemExpanded(int index) {
    if (index < 0 || index >= state.items.length) return;
    final item = state.items[index];
    updateItem(index, item.copyWith(expanded: !item.expanded));
  }

  void removeItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items]..removeAt(index);
    emit(state.copyWith(items: items));
  }

  // ---- Totals (client-side preview) ------------------------------------- //

  double get computedSubtotal => state.items.fold(
        0,
        (sum, i) => sum + (_num(i.wholesalePrice) * _num(i.quantity)),
      );

  double get computedTaxTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.tax));

  double get computedDiscountTotal =>
      state.items.fold(0, (sum, i) => sum + _num(i.discount));

  double get computedGrandTotal =>
      computedSubtotal + computedTaxTotal - computedDiscountTotal;

  // ---- Submit ------------------------------------------------------------ //

  /// Builds and POSTs the invoice body. [invoiceDate] is `Y-m-d`,
  /// [paymentMethod] is the chosen enum, [amountPaid] is the raw string
  /// (validated by the caller), [notes] is optional.
  Future<void> submit({
    required String invoiceDate,
    required InvoicePaymentMethod paymentMethod,
    required String amountPaid,
    String? notes,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));

    final itemsJson = <Map<String, dynamic>>[];
    for (final i in state.items) {
      final item = <String, dynamic>{
        'product_id': i.product?.id,
        'quantity': int.tryParse(i.quantity.trim()) ?? 0,
        'wholesale_price': _num(i.wholesalePrice),
        if (i.tax.trim().isNotEmpty) 'tax': _num(i.tax),
        if (i.discount.trim().isNotEmpty) 'discount': _num(i.discount),
        if (i.batchNumber.trim().isNotEmpty)
          'batch_number': i.batchNumber.trim(),
        if (i.expiryDate.trim().isNotEmpty)
          'expiry_date': i.expiryDate.trim(),
        if (i.sellingPrice.trim().isNotEmpty)
          'selling_price': _num(i.sellingPrice),
      };
      itemsJson.add(item);
    }

    final body = <String, dynamic>{
      'supplier_id': state.selectedSupplier?.id,
      'invoice_date': invoiceDate,
      'payment_method': paymentMethod.name,
      'amount_paid': _num(amountPaid),
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      'items': itemsJson,
    };

    final result = await invoiceRepository.createInvoice(body);
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

  double _num(String s) => double.tryParse(s.trim()) ?? 0;
}
