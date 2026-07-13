import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';

part 'supplier_debt_detail_state.freezed.dart';

@freezed
sealed class SupplierDebtDetailState with _$SupplierDebtDetailState {
  const factory SupplierDebtDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isPaying,
    SupplierDebtModel? debt,
    Failure? failure,
    @Default(false) bool justPaid,
  }) = _SupplierDebtDetailState;
}
