import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

part 'dashboard_state.freezed.dart';

/// State for the Dashboard's low-stock alerts section. The products list comes
/// from the backend `GET /products/low-stock` (ordered by total quantity asc).
@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(<ProductCardModel>[]) List<ProductCardModel> lowStockProducts,
    @Default(false) bool isInitialLoading,
    @Default(false) bool isRefreshing,
    Failure? failure,
  }) = _DashboardState;
}
