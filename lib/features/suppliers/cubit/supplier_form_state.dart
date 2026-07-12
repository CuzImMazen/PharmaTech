import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';

part 'supplier_form_state.freezed.dart';

/// Holds the Add/Edit Supplier form state: the company dropdown options (with
/// their own loading/error flags) and the transient save outcome. The text
/// field values live in [TextEditingController]s owned by the form widget.
@freezed
abstract class SupplierFormState with _$SupplierFormState {
  const factory SupplierFormState({
    @Default(<CompanyModel>[]) List<CompanyModel> companies,
    @Default(false) bool isOptionsLoading,
    @Default(false) bool hasCompaniesError,
    CompanyModel? selectedCompany,
    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,
  }) = _SupplierFormState;
}
