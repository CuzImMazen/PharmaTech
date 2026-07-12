import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/stock_adjustments/cubit/stock_adjustment_state.dart';
import 'package:pharmacy_app/features/stock_adjustments/data/repo/stock_adjustment_repository.dart';

/// Drives the Stock Adjustments log screen: paginated fetch of the pharmacy's
/// manual stock corrections (add/remove). Read-only — no mutations.
class StockAdjustmentCubit extends Cubit<StockAdjustmentState> {
  StockAdjustmentCubit({required this.repository})
    : super(const StockAdjustmentState());

  final StockAdjustmentRepository repository;

  /// Initial load.
  Future<void> loadAdjustments() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page.
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) return;
    await _fetch(page: state.currentPage + 1, append: true);
  }

  Future<void> _fetch({
    bool reset = false,
    bool forceRefresh = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed) return;

    if (reset) {
      final firstLoad = state.adjustments.isEmpty;
      emit(
        state.copyWith(
          isInitialLoading: firstLoad,
          isRefreshing: !firstLoad || forceRefresh,
          isLoadingMore: false,
          failure: null,
          currentPage: 1,
        ),
      );
    } else if (append) {
      emit(state.copyWith(isLoadingMore: true, failure: null));
    }

    final result = await repository.fetchAdjustments(page: reset ? 1 : page);
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isInitialLoading: false,
          isRefreshing: false,
          isLoadingMore: false,
          failure: failure,
        ),
      ),
      (pageResult) {
        final list =
            append
                ? [...state.adjustments, ...pageResult.adjustments]
                : pageResult.adjustments;
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            adjustments: list,
            currentPage: pageResult.currentPage,
            lastPage: pageResult.lastPage,
            hasMore: pageResult.hasMore,
            failure: null,
          ),
        );
      },
    );
  }
}
