import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/suppliers/cubit/supplier_state.dart';
import 'package:pharmacy_app/features/suppliers/data/repo/supplier_repository.dart';

/// Drives the Suppliers list screen: paginated fetch with search + a
/// "show deleted" toggle, and create/update/delete/restore mutations that
/// update the local list so changes show instantly.
class SupplierCubit extends Cubit<SupplierState> {
  SupplierCubit({required this.repository}) : super(const SupplierState());

  final SupplierRepository repository;

  /// Initial load.
  Future<void> loadSuppliers() => _fetch(reset: true);

  /// Pull-to-refresh / retry.
  Future<void> refresh() => _fetch(reset: true, forceRefresh: true);

  /// Infinite-scroll next page (no-op if already loading or no more pages).
  Future<void> loadNextPage() async {
    if (state.isInitialLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }
    await _fetch(page: state.currentPage + 1, append: true);
  }

  /// Search query (debounced in the screen). Resets to page 1.
  void updateSearchQuery(String query) {
    if (query == state.searchQuery) return;
    emit(state.copyWith(searchQuery: query));
    unawaited(_fetch(reset: true));
  }

  /// Toggles showing soft-deleted suppliers, then reloads from page 1.
  Future<void> toggleShowDeleted() async {
    emit(state.copyWith(showDeleted: !state.showDeleted));
    await _fetch(reset: true);
  }

  Future<void> _fetch({
    bool reset = false,
    bool forceRefresh = false,
    int page = 1,
    bool append = false,
  }) async {
    if (isClosed) return;

    if (reset) {
      final firstLoad = state.suppliers.isEmpty;
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

    final result = await repository.fetchSuppliers(
      search: state.searchQuery.trim().isEmpty ? null : state.searchQuery.trim(),
      withTrashed: state.showDeleted,
      page: reset ? 1 : page,
    );
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
            append ? [...state.suppliers, ...pageResult.suppliers] : pageResult.suppliers;
        emit(
          state.copyWith(
            isInitialLoading: false,
            isRefreshing: false,
            isLoadingMore: false,
            suppliers: list,
            currentPage: pageResult.currentPage,
            lastPage: pageResult.lastPage,
            hasMore: pageResult.hasMore,
            failure: null,
          ),
        );
      },
    );
  }

  // ---- Mutations ------------------------------------------------------- //

  Future<void> deleteSupplier(int id) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        mutatingId: id,
        failure: null,
        lastAction: null,
        actionId: null,
      ),
    );
    final result = await repository.deleteSupplier(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(mutatingId: null, failure: failure),
      ),
      (_) {
        // When not showing deleted, drop it from the list instantly. When
        // showing deleted, the row stays but `deleted_at` is now populated —
        // refetch so the deleted pill + Restore action render correctly.
        final updated = state.suppliers.where((s) => s.id != id).toList();
        emit(
          state.copyWith(
            mutatingId: null,
            suppliers: updated,
            lastAction: SupplierActionResult.deleted,
            actionId: id,
          ),
        );
        if (state.showDeleted) unawaited(refresh());
      },
    );
  }

  Future<void> restoreSupplier(int id) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        mutatingId: id,
        failure: null,
        lastAction: null,
        actionId: null,
      ),
    );
    final result = await repository.restoreSupplier(id);
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(mutatingId: null, failure: failure),
      ),
      (supplier) {
        // When showing deleted, restoring removes it from the deleted view
        // (it's no longer soft-deleted); reload to keep the list consistent.
        emit(
          state.copyWith(
            mutatingId: null,
            lastAction: SupplierActionResult.restored,
            actionId: id,
          ),
        );
        unawaited(refresh());
      },
    );
  }

  /// Clears the transient action/failure signal after the UI has reacted.
  void clearAction() {
    if (isClosed) return;
    if (state.lastAction != null ||
        state.failure != null ||
        state.actionId != null) {
      emit(
        state.copyWith(
          lastAction: null,
          failure: null,
          actionId: null,
        ),
      );
    }
  }
}
