import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/features/dashboard/cubit/dashboard_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';

/// Drives the Dashboard. Currently owns the low-stock alerts section: loads
/// products at or below their min-stock threshold via
/// `GET /products/low-stock`.
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.inventoryRepository})
    : super(const DashboardState());

  final InventoryRepository inventoryRepository;

  /// Loads the low-stock products. A failure is surfaced via [failure] without
  /// clearing any previously-loaded list (so a refresh error keeps old data).
  Future<void> loadLowStock() async {
    if (isClosed) return;
    final isFirstLoad = state.lowStockProducts.isEmpty;
    emit(
      state.copyWith(
        isInitialLoading: isFirstLoad,
        isRefreshing: !isFirstLoad,
        failure: null,
      ),
    );

    final result = await inventoryRepository.fetchLowStock(perPage: 100);
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isInitialLoading: false,
          isRefreshing: false,
          failure: failure,
        ),
      ),
      (products) => emit(
        state.copyWith(
          isInitialLoading: false,
          isRefreshing: false,
          lowStockProducts: products,
          failure: null,
        ),
      ),
    );
  }

  /// Derives a [StockAlertType] from a product's quantities, mirroring the
  /// backend severity logic in `ProductController::lowStock`:
  /// out (no active stock) / critical (min_stock >= stock*4) / low otherwise.
  StockAlertType severityFor(ProductCardModel product) {
    final qty = product.quantity;
    final min = product.minStock;
    if (qty <= 0) return StockAlertType.out;
    if (min > 0 && qty * 4 <= min) return StockAlertType.critical;
    return StockAlertType.low;
  }
}
