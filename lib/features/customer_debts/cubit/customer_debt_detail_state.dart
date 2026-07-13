import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';

part 'customer_debt_detail_state.freezed.dart';

@freezed
sealed class CustomerDebtDetailState with _$CustomerDebtDetailState {
  const factory CustomerDebtDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isPaying,
    CustomerDebtModel? debt,
    Failure? failure,
    @Default(false) bool justPaid,
  }) = _CustomerDebtDetailState;
}
