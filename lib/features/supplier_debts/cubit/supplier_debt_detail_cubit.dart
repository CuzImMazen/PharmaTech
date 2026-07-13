import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/supplier_debts/cubit/supplier_debt_detail_state.dart';
import 'package:pharmacy_app/features/supplier_debts/data/repo/supplier_debt_repository.dart';

/// Loads a single supplier debt (with its payments) for the detail screen.
class SupplierDebtDetailCubit extends Cubit<SupplierDebtDetailState> {
  SupplierDebtDetailCubit({required this.repository})
    : super(const SupplierDebtDetailState());

  final SupplierDebtRepository repository;

  Future<void> loadDebt(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await repository.fetchDebt(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (debt) => emit(state.copyWith(isLoading: false, debt: debt)),
    );
  }

  Future<void> refresh(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true));
    final result = await repository.fetchDebt(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (debt) => emit(state.copyWith(isRefreshing: false, debt: debt)),
    );
  }

  /// Records a payment against the debt. On success the updated debt (with its
  /// payments) is emitted and `justPaid` flashes so the screen can show a
  /// snackbar. The returned debt replaces the cached one.
  Future<void> payDebt(
    int id, {
    required double amount,
    required String paymentDate,
    String? notes,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(isPaying: true, failure: null));
    final result = await repository.payDebt(
      id,
      amount: amount,
      paymentDate: paymentDate,
      notes: notes,
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isPaying: false, failure: failure)),
      (debt) =>
          emit(state.copyWith(isPaying: false, debt: debt, justPaid: true)),
    );
  }

  /// Clears the one-shot `justPaid` / `failure` signals after the screen has
  /// reacted to them.
  void clearSignal() {
    if (isClosed) return;
    if (state.justPaid || state.failure != null) {
      emit(state.copyWith(justPaid: false, failure: null));
    }
  }
}
