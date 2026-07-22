import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

part 'purchase_invoice_form_state.freezed.dart';

/// Holds the dynamic line-items + dropdown options for the Add Invoice form.
/// Text-field values live in controllers in the form widget; this holds the
/// structural state (the items list, the selected supplier, and the
/// transient save outcome).
@freezed
abstract class PurchaseInvoiceFormState with _$PurchaseInvoiceFormState {
  const factory PurchaseInvoiceFormState({
    @Default(<SupplierModel>[]) List<SupplierModel> suppliers,
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasOptionsError,
    Failure? optionsFailure,

    SupplierModel? selectedSupplier,

    @Default(<PurchaseInvoiceItemInput>[])
    List<PurchaseInvoiceItemInput> items,

    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,

    /// True while a barcode lookup is in flight from the in-form scanner.
    @Default(false) bool isScanning,
  }) = _PurchaseInvoiceFormState;
}

/// One editable line item in the Add Invoice form. Holds the dropdown selection
/// (`product`) + the per-line numeric inputs. `batchNumber`, `expiryDate`, and
/// `sellingPrice` are optional; the rest are required to submit.
@freezed
abstract class PurchaseInvoiceItemInput with _$PurchaseInvoiceItemInput {
  const factory PurchaseInvoiceItemInput({
    ProductCardModel? product,
    @Default('') String quantity,
    @Default('') String wholesalePrice,
    @Default('') String tax,
    @Default('') String discount,
    @Default('') String batchNumber,
    @Default('') String expiryDate,
    @Default('') String sellingPrice,
    @Default(false) bool expanded,
  }) = _PurchaseInvoiceItemInput;
}
