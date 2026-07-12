import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/customers/data/models/customers_page.dart';

import 'customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  CustomerRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, CustomersPage>> fetchCustomers({
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
        ApiRoutes.customers,
        queryParameters: queryParameters,
      );

      final customers = ApiParser.parseWrappedList(
        response.data,
        'data',
        CustomerModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        CustomersPage(
          customers: customers,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? customers.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> fetchCustomer(int id) async {
    try {
      final response = await api.get(ApiRoutes.customerDetail(id));
      final customer = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerModel.fromJson,
      );
      return Right(customer);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> createCustomer(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(ApiRoutes.customers, data: body);
      final customer = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerModel.fromJson,
      );
      return Right(customer);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> updateCustomer(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.put(
        ApiRoutes.customerDetail(id),
        data: body,
      );
      final customer = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerModel.fromJson,
      );
      return Right(customer);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(int id) async {
    try {
      await api.delete(ApiRoutes.customerDetail(id));
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> restoreCustomer(int id) async {
    try {
      final response = await api.patch(ApiRoutes.customerRestore(id));
      final customer = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerModel.fromJson,
      );
      return Right(customer);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
