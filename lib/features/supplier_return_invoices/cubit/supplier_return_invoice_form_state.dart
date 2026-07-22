import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

part 'supplier_return_invoice_form_state.freezed.dart';

/// Holds the dynamic line-items + dropdown options for the Add Supplier Return
/// form. Text-field values live in controllers in the form widget; this holds
/// the structural state (the items list, the selected supplier, and the
/// transient save outcome).
@freezed
abstract class SupplierReturnInvoiceFormState
    with _$SupplierReturnInvoiceFormState {
  const factory SupplierReturnInvoiceFormState({
    @Default(<SupplierModel>[]) List<SupplierModel> suppliers,
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasOptionsError,
    Failure? optionsFailure,

    SupplierModel? selectedSupplier,

    /// The optional original purchase invoice this return is linked to.
    int? originalPurchaseInvoiceId,

    /// Products allowed to be selected when seeded from an invoice. Empty means
    /// no restriction (standalone return). Used to filter the product dropdown.
    @Default(<int>{}) Set<int> allowedProductIds,

    /// Maps each original invoice product id to its purchased quantity for
    /// seeded returns, so the form can cap return quantities per product.
    @Default(<int, int>{}) Map<int, int> originalInvoiceQuantities,

    @Default(<SupplierReturnItemInput>[])
    List<SupplierReturnItemInput> items,

    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,

    /// True while a barcode lookup is in flight from the in-form scanner.
    @Default(false) bool isScanning,
  }) = _SupplierReturnInvoiceFormState;
}

/// One editable line item in the Add Supplier Return form. Holds the dropdown
/// selection (`product`) + the per-line numeric inputs. `tax` and `discount`
/// are optional; the rest are required to submit.
@freezed
abstract class SupplierReturnItemInput with _$SupplierReturnItemInput {
  const factory SupplierReturnItemInput({
    ProductCardModel? product,

    /// The original purchase product id on seeded returns, kept so the row can
    /// be matched to a product once the dropdown options load.
    int? originalProductId,
    @Default('') String quantity,
    @Default('') String unitPrice,
    @Default('') String tax,
    @Default('') String discount,
    @Default(false) bool expanded,
  }) = _SupplierReturnItemInput;
}
