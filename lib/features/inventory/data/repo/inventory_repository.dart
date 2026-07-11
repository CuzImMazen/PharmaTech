import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/company_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/inventory_products_page.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';

abstract class InventoryRepository {
  Future<Either<Failure, InventoryProductsPage>> fetchProducts({
    String? search,
    String? categoryId,
    String? companyId,
    int? baseUnitId,
    bool? prescriptionRequired,
    List<String>? expiryFilter,
    String? sortBy,
    String? stockStatus,
    bool inStockOnly = false,
    num? minPrice,
    num? maxPrice,
    int page,
    int perPage,
  });

  Future<Either<Failure, List<ProductCategoryModel>>> fetchCategories({
    String? search,
    int perPage,
  });

  Future<Either<Failure, List<BaseUnitModel>>> fetchUnits({
    String? type,
    int perPage,
  });

  Future<Either<Failure, List<CompanyModel>>> fetchCompanies({
    String? search,
    int perPage,
  });

  /// Products at or below their min-stock threshold, ordered by total quantity
  /// ascending. Maps to the backend `GET /products/low-stock` (returns
  /// `ProductCardResource` with `stock_status`, `total_quantity`, `min_stock`).
  Future<Either<Failure, List<ProductCardModel>>> fetchLowStock({
    String? severity,
    int perPage,
  });
}
