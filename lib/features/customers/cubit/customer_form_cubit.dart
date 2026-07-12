import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/customers/cubit/customer_form_state.dart';
import 'package:pharmacy_app/features/customers/data/repo/customer_repository.dart';

/// Drives the Add/Edit Customer form. Submits a create or update; the text
/// fields themselves live in the form widget's controllers.
class CustomerFormCubit extends Cubit<CustomerFormState> {
  CustomerFormCubit({required this.customerRepository})
      : super(const CustomerFormState());

  final CustomerRepository customerRepository;

  /// Submits the form. When [customerId] is null → create (POST); otherwise
  /// update (PUT). [body] is the snake_case payload (omitting empty optionals
  /// so the backend keeps them null).
  Future<void> submit({
    int? customerId,
    required Map<String, dynamic> body,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));
    final result = customerId == null
        ? await customerRepository.createCustomer(body)
        : await customerRepository.updateCustomer(customerId, body);
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
