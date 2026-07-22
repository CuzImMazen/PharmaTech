import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/cubit/supplier_return_invoice_form_state.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/repo/supplier_return_invoice_repository.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';
import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository.dart';

/// Result of resolving a scanned barcode into a line item, for the form to
/// surface as UI (success / not-found / error). The cubit stays UI-free; the
/// screen localizes the [Failure] via `failure.localizedMessage(context)`.
sealed class SupplierReturnScannedProductResult {
  const SupplierReturnScannedProductResult();
  const factory SupplierReturnScannedProductResult.added(
    ProductCardModel product,
  ) = SupplierReturnScannedAdded;
  const factory SupplierReturnScannedProductResult.notFound() =
      SupplierReturnScannedNotFound;
  const factory SupplierReturnScannedProductResult.notAllowed() =
      SupplierReturnScannedNotAllowed;
  const factory SupplierReturnScannedProductResult.error(Failure failure) =
      SupplierReturnScannedError;
}

class SupplierReturnScannedAdded extends SupplierReturnScannedProductResult {
  const SupplierReturnScannedAdded(this.product);
  final ProductCardModel product;
}

class SupplierReturnScannedNotFound extends SupplierReturnScannedProductResult {
  const SupplierReturnScannedNotFound();
}

class SupplierReturnScannedNotAllowed extends SupplierReturnScannedProductResult {
  const SupplierReturnScannedNotAllowed();
}

class SupplierReturnScannedError extends SupplierReturnScannedProductResult {
  const SupplierReturnScannedError(this.failure);
  final Failure failure;
}

/// Drives the Add Supplier Return Invoice form. Loads the supplier + product
/// dropdown options and owns the dynamic line-items list. `submit()` builds
/// the snake_case body and POSTs it; the date + refund method + reason + notes
/// live in controllers in the form widget (passed into `submit`).
class SupplierReturnInvoiceFormCubit
    extends Cubit<SupplierReturnInvoiceFormState> {
  SupplierReturnInvoiceFormCubit({
    required this.returnRepository,
    required this.supplierRepository,
    required this.inventoryRepository,
  }) : super(const SupplierReturnInvoiceFormState());

  final SupplierReturnInvoiceRepository returnRepository;
  final SupplierRepository supplierRepository;
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
    final suppliersResult = await supplierRepository.fetchSuppliers(
      perPage: 200,
    );
    final productsResult = await inventoryRepository.fetchProducts(
      page: 1,
      perPage: 200,
    );
    if (isClosed) return;

    if (suppliersResult.isLeft() || productsResult.isLeft()) {
      Failure? failure;
      suppliersResult.fold((f) => failure = f, (_) {});
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

    final suppliers =
        suppliersResult.fold((_) => <SupplierModel>[], (p) => p.suppliers);
    final products =
        productsResult.fold((_) => <ProductCardModel>[], (p) => p.products);

    final autoFilledItems = _autoFillSeededItems(state.items, products);

    emit(
      state.copyWith(
        isOptionsLoading: false,
        hasOptionsError: false,
        optionsFailure: null,
        suppliers: suppliers,
        products: products,
        items: autoFilledItems,
      ),
    );
  }

  /// Matches seeded rows that only have an [originalProductId] (because the
  /// dropdown was still loading) to their real [ProductCardModel] now that
  /// options are available.
  List<SupplierReturnItemInput> _autoFillSeededItems(
    List<SupplierReturnItemInput> items,
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

  void selectSupplier(SupplierModel? supplier) =>
      emit(state.copyWith(selectedSupplier: supplier));

  // ---- Line items -------------------------------------------------------- //

  void addItem() {
    emit(
      state.copyWith(
        items: [
          ...state.items,
          const SupplierReturnItemInput(expanded: true),
        ],
      ),
    );
  }

  void updateItem(int index, SupplierReturnItemInput updated) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items];
    items[index] = updated;
    emit(state.copyWith(items: items));
  }

  /// Sets the product on a row and pre-fills the unit price from the product's
  /// selling price when the row had no price yet.
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
    final prefilled = current.unitPrice.trim().isEmpty && product != null
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

  // ---- Seed from purchase invoice ---------------------------------------- //

  /// Prefills the form from a completed purchase invoice: the supplier, the
  /// original purchase invoice id, and one line item per purchase item
  /// (quantity = the original qty, unit price = the purchase item's wholesale
  /// price). Idempotent — only the first call seeds.
  void seedFromPurchaseInvoice(PurchaseInvoiceModel purchase) {
    if (isClosed || _seeded) return;
    _seeded = true;

    final supplier = purchase.supplier;
    final invoiceItems = purchase.items ?? <PurchaseInvoiceItemModel>[];
    final allowedProductIds = <int>{
      for (final i in invoiceItems) i.productId,
    };
    final originalQuantities = <int, int>{
      for (final i in invoiceItems) i.productId: i.quantity,
    };
    final items = <SupplierReturnItemInput>[];
    for (final i in invoiceItems) {
      items.add(
        SupplierReturnItemInput(
          originalProductId: i.productId,
          quantity: i.quantity.toString(),
          unitPrice: i.wholesalePrice.toStringAsFixed(2),
          expanded: true,
        ),
      );
    }

    emit(
      state.copyWith(
        selectedSupplier: supplier,
        originalPurchaseInvoiceId: purchase.id,
        allowedProductIds: allowedProductIds,
        originalInvoiceQuantities: originalQuantities,
        items: items,
      ),
    );
  }

  // ---- Barcode scan ----------------------------------------------------- //

  /// Looks up the scanned barcode and replaces the product on the row at
  /// [targetIndex] when given; appends a new row only when no target row is
  /// given. Returns a [SupplierReturnScannedProductResult] for the screen to
  /// surface (not-found / error snackbars); the cubit never touches
  /// BuildContext.
  Future<SupplierReturnScannedProductResult> addScannedItem(
    String barcode, {
    int? targetIndex,
  }) async {
    if (isClosed) return const SupplierReturnScannedProductResult.notFound();
    emit(state.copyWith(isScanning: true));
    final result = await inventoryRepository.lookupByBarcode(barcode);
    if (isClosed) return const SupplierReturnScannedProductResult.notFound();
    emit(state.copyWith(isScanning: false));
    return result.fold(
      (failure) => SupplierReturnScannedProductResult.error(failure),
      (detail) {
        if (detail == null) {
          return const SupplierReturnScannedProductResult.notFound();
        }
        final card = detail.toProductCard();
        if (state.allowedProductIds.isNotEmpty &&
            !state.allowedProductIds.contains(card.id)) {
          return const SupplierReturnScannedProductResult.notAllowed();
        }
        _applyScannedProduct(detail, targetIndex: targetIndex);
        return SupplierReturnScannedProductResult.added(card);
      },
    );
  }

  /// Replaces the product on [targetIndex] when it's a valid row (whether or
  /// not that row already had a product), else appends a new expanded item.
  /// Pre-fills the unit price from the detail's selling price when the row had
  /// no price yet and preserves any quantity/tax/discount the user typed.
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
      items[targetIndex] = SupplierReturnItemInput(
        product: card,
        quantity: current.quantity,
        unitPrice: current.unitPrice.trim().isEmpty
            ? detail.sellingPrice.toStringAsFixed(2)
            : current.unitPrice,
        tax: current.tax,
        discount: current.discount,
        expanded: current.expanded,
      );
      emit(state.copyWith(items: items));
      return;
    }
    final prefilled = SupplierReturnItemInput(
      product: card,
      unitPrice: detail.sellingPrice.toStringAsFixed(2),
      expanded: true,
    );
    emit(state.copyWith(items: [...items, prefilled]));
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

  double get computedRefundTotal =>
      computedSubtotal + computedTaxTotal - computedDiscountTotal;

  // ---- Submit ------------------------------------------------------------ //

  /// Builds and POSTs the return body. [invoiceDate] is `Y-m-d`,
  /// [refundMethod] is the chosen enum, [reason] and [notes] are optional.
  /// `supplier_id` is required — the caller validates it before invoking.
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
      if (productId != null && state.originalPurchaseInvoiceId != null) {
        final preceding = originalQtyByProductId[productId] ?? 0;
        final original = state.originalInvoiceQuantities[productId];
        if (original != null && preceding + returnQty > original) {
          emit(
            state.copyWith(
              isSaving: false,
              failure: ValidationFailure(
                message: 'Return quantity exceeds original invoice quantity',
                errors: const {},
              ),
            ),
          );
          return;
        }
        originalQtyByProductId[productId] = preceding + returnQty;
      }
      final item = <String, dynamic>{
        'product_id': i.product?.id,
        'quantity': int.tryParse(i.quantity.trim()) ?? 0,
        'unit_price': _num(i.unitPrice),
        if (i.tax.trim().isNotEmpty) 'tax': _num(i.tax),
        if (i.discount.trim().isNotEmpty) 'discount': _num(i.discount),
      };
      itemsJson.add(item);
    }

    final body = <String, dynamic>{
      'supplier_id': state.selectedSupplier?.id,
      if (state.originalPurchaseInvoiceId != null)
        'original_purchase_invoice_id': state.originalPurchaseInvoiceId,
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
