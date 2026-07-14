import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

part 'customer_return_invoice_form_state.freezed.dart';

/// Holds the dynamic line-items + dropdown options for the New Customer Return
/// form. Text-field values live in controllers in the form widget; this holds
/// the structural state (the items list, the selected customer, the seeded
/// original invoice, and the transient save outcome). Mirrors
/// [SalesInvoiceFormState].
@freezed
abstract class CustomerReturnInvoiceFormState
    with _$CustomerReturnInvoiceFormState {
  const factory CustomerReturnInvoiceFormState({
    @Default(<CustomerModel>[]) List<CustomerModel> customers,
    @Default(<ProductCardModel>[]) List<ProductCardModel> products,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasOptionsError,

    CustomerModel? selectedCustomer,

    /// Set when the return is seeded from a sales invoice — sent as
    /// `original_sales_invoice_id` on submit.
    int? originalSalesInvoiceId,

    /// Products allowed to be selected when seeded from an invoice. Empty means
    /// no restriction (standalone return). Used to filter the product dropdown.
    @Default(<int>{}) Set<int> allowedProductIds,

    /// Maps each original invoice product id to its sold quantity for seeded
    /// returns, so the form can cap return quantities per product.
    @Default(<int, int>{}) Map<int, int> originalInvoiceQuantities,

    @Default(<CustomerReturnItemInput>[])
    List<CustomerReturnItemInput> items,

    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,

    /// True while a barcode lookup is in flight from the in-form scanner.
    @Default(false) bool isScanning,
  }) = _CustomerReturnInvoiceFormState;
}

/// One editable line item in the New Customer Return form. Holds the dropdown
/// selection (`product`) + the per-line numeric inputs. `tax` and `discount`
/// are optional; `quantity` and `unitPrice` are required to submit.
@freezed
abstract class CustomerReturnItemInput with _$CustomerReturnItemInput {
  const factory CustomerReturnItemInput({
    ProductCardModel? product,

    /// The original sale product id on seeded returns, kept so the row can be
    /// matched to a product once the dropdown options load.
    int? originalProductId,
    @Default('') String quantity,
    @Default('') String unitPrice,
    @Default('') String tax,
    @Default('') String discount,
  }) = _CustomerReturnItemInput;
}
