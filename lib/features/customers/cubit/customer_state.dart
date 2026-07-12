import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';

part 'customer_state.freezed.dart';

/// Outcome of a customer mutation, surfaced to the UI via BlocListener.
enum CustomerActionResult { created, updated, deleted, restored }

@freezed
sealed class CustomerState with _$CustomerState {
  const factory CustomerState({
    @Default(<CustomerModel>[]) List<CustomerModel> customers,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default('') String searchQuery,
    @Default(false) bool showDeleted,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(true) bool hasMore,
    Failure? failure,
    CustomerActionResult? lastAction,
    int? actionId,
    @Default(false) bool isSaving,
    int? mutatingId,
  }) = _CustomerState;
}
