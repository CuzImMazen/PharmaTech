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
      (failure) =>
          emit(state.copyWith(isLoading: false, failure: failure)),
      (debt) => emit(state.copyWith(isLoading: false, debt: debt)),
    );
  }

  Future<void> refresh(int id) async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true));
    final result = await repository.fetchDebt(id);
    if (isClosed) return;
    result.fold(
      (failure) =>
          emit(state.copyWith(isRefreshing: false, failure: failure)),
      (debt) => emit(state.copyWith(isRefreshing: false, debt: debt)),
    );
  }
}
