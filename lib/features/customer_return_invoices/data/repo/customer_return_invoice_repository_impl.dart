import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoice_model.dart';
import 'package:pharmacy_app/features/customer_return_invoices/data/models/customer_return_invoices_page.dart';

import 'customer_return_invoice_repository.dart';

class CustomerReturnInvoiceRepositoryImpl
    implements CustomerReturnInvoiceRepository {
  CustomerReturnInvoiceRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, CustomerReturnInvoicesPage>> fetchReturns({
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'per_page': perPage,
      };

      final response = await api.get(
        ApiRoutes.customerReturnInvoices,
        queryParameters: queryParameters,
      );

      final returns = ApiParser.parseWrappedList(
        response.data,
        'data',
        CustomerReturnInvoiceModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        CustomerReturnInvoicesPage(
          returns: returns,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? returns.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerReturnInvoiceModel>> fetchReturn(int id) async {
    try {
      final response = await api.get(ApiRoutes.customerReturnInvoiceDetail(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerReturnInvoiceModel>> createReturn(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.customerReturnInvoices,
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CustomerReturnInvoiceModel>> cancelReturn(int id) async {
    try {
      final response =
          await api.patch(ApiRoutes.customerReturnInvoiceCancel(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        CustomerReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
