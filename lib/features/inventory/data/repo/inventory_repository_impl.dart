import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/inventory/data/models/base_unit_model.dart';
import 'package:pharmacy_app/features/inventory/data/models/inventory_products_page.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_category.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_card_model.dart';

import 'inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  InventoryRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, InventoryProductsPage>> fetchProducts({
    String? search,
    String? categoryId,
    int? companyId,
    int? baseUnitId,
    bool? prescriptionRequired,
    List<String>? expiryFilter,
    String? sortBy,
    String? stockStatus,
    bool inStockOnly = false,
    num? minPrice,
    num? maxPrice,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'search': search?.trim().isEmpty ?? true ? null : search!.trim(),
        'category_id': categoryId,
        'company_id': companyId,
        'base_unit_id': baseUnitId,
        'prescription_required': prescriptionRequired,
        'expiry_filter': expiryFilter?.isEmpty ?? true
            ? null
            : expiryFilter!.join(','),
        'sort_by': sortBy,
        'stock_status': stockStatus,
        'in_stock': inStockOnly ? 1 : null,
        'min_price': minPrice,
        'max_price': maxPrice,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.products,
        queryParameters: queryParameters,
      );

      final products = ApiParser.parseWrappedList(
        response.data,
        'data',
        ProductCardModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        InventoryProductsPage(
          products: products,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? products.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductCategoryModel>>> fetchCategories({
    String? search,
    int perPage = 200,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'search': search?.trim().isEmpty ?? true ? null : search!.trim(),
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.categories,
        queryParameters: queryParameters,
      );

      final categories = ApiParser.parseWrappedList(
        response.data,
        'data',
        ProductCategoryModel.fromJson,
      );

      return Right(categories);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<BaseUnitModel>>> fetchUnits({
    String? type,
    int perPage = 200,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'type': type,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.units,
        queryParameters: queryParameters,
      );

      final units = ApiParser.parseWrappedList(
        response.data,
        'data',
        BaseUnitModel.fromJson,
      );

      return Right(units);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
