import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

part 'sales_invoice_form_state.freezed.dart';

/// Holds the dynamic line-items + dropdown options for the New Sale form.
/// Text-field values live in controllers in the form widget; this holds the
/// structural state (the items list, the selected customer, and the
/// transient save outcome).
@freezed
abstract class SalesInvoiceFormState with _$SalesInvoiceFormState {
  const factory SalesInvoiceFormState({
    @Default(<CustomerModel>[]) List<CustomerModel> customers,
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasOptionsError,
    Failure? optionsFailure,

    CustomerModel? selectedCustomer,

    @Default(<SalesInvoiceItemInput>[])
    List<SalesInvoiceItemInput> items,

    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,

    /// True while a barcode lookup is in flight from the in-form scanner.
    @Default(false) bool isScanning,
  }) = _SalesInvoiceFormState;
}

/// One editable line item in the New Sale form. Holds the dropdown selection
/// (`product`) + the per-line numeric inputs. `tax` and `discount` are
/// optional; `quantity` and `sellingPrice` are required to submit. Unlike a
/// purchase invoice, sales items carry no batch/expiry inputs — stock is
/// decremented server-side (FIFO).
@freezed
abstract class SalesInvoiceItemInput with _$SalesInvoiceItemInput {
  const factory SalesInvoiceItemInput({
    ProductCardModel? product,
    @Default('') String quantity,
    @Default('') String sellingPrice,
    @Default('') String tax,
    @Default('') String discount,
  }) = _SalesInvoiceItemInput;
}
