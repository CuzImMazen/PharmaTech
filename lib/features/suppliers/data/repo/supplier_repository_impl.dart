import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';
import 'package:pharmacy_app/features/suppliers/data/models/suppliers_page.dart';

import 'supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  SupplierRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, SuppliersPage>> fetchSuppliers({
    String? search,
    bool withTrashed = false,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'search': search?.trim().isEmpty ?? true ? null : search!.trim(),
        'with_trashed': withTrashed ? 1 : null,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.suppliers,
        queryParameters: queryParameters,
      );

      final suppliers = ApiParser.parseWrappedList(
        response.data,
        'data',
        SupplierModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        SuppliersPage(
          suppliers: suppliers,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? suppliers.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierModel>> fetchSupplier(int id) async {
    try {
      final response = await api.get(ApiRoutes.supplierDetail(id));
      final supplier = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierModel.fromJson,
      );
      return Right(supplier);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierModel>> createSupplier(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(ApiRoutes.suppliers, data: body);
      final supplier = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierModel.fromJson,
      );
      return Right(supplier);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierModel>> updateSupplier(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.put(
        ApiRoutes.supplierDetail(id),
        data: body,
      );
      final supplier = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierModel.fromJson,
      );
      return Right(supplier);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSupplier(int id) async {
    try {
      await api.delete(ApiRoutes.supplierDetail(id));
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierModel>> restoreSupplier(int id) async {
    try {
      final response = await api.patch(ApiRoutes.supplierRestore(id));
      final supplier = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierModel.fromJson,
      );
      return Right(supplier);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
