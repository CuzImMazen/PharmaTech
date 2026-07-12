import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/suppliers/cubit/supplier_form_state.dart';
import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository.dart';

/// Drives the Add/Edit Supplier form. Loads the company dropdown options
/// (reusing `InventoryRepository.fetchCompanies`) and submits a create or
/// update. The text fields themselves live in the form widget's controllers.
class SupplierFormCubit extends Cubit<SupplierFormState> {
  SupplierFormCubit({
    required this.supplierRepository,
    required this.inventoryRepository,
  }) : super(const SupplierFormState());

  final SupplierRepository supplierRepository;
  final InventoryRepository inventoryRepository;

  /// Loads the company options for the dropdown.
  Future<void> loadOptions() async {
    if (isClosed) return;
    emit(state.copyWith(isOptionsLoading: true, hasCompaniesError: false));
    final result = await inventoryRepository.fetchCompanies(perPage: 200);
    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(isOptionsLoading: false, hasCompaniesError: true)),
      (items) => emit(
        state.copyWith(isOptionsLoading: false, companies: items),
      ),
    );
  }

  Future<void> reloadCompanies() => loadOptions();

  void selectCompany(CompanyModel? company) =>
      emit(state.copyWith(selectedCompany: company));

  /// Submits the form. When [supplierId] is null → create (POST); otherwise
  /// update (PUT). [body] is the snake_case payload (omitting empty optionals
  /// so the backend keeps them null).
  Future<void> submit({int? supplierId, required Map<String, dynamic> body}) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));
    final result = supplierId == null
        ? await supplierRepository.createSupplier(body)
        : await supplierRepository.updateSupplier(supplierId, body);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isSaving: false, failure: failure)),
      (_) => emit(state.copyWith(isSaving: false, saved: true)),
    );
  }

  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) {
      emit(state.copyWith(failure: null));
    }
  }
}
