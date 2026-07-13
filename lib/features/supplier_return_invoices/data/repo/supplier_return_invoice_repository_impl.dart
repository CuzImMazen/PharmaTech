import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoice_model.dart';
import 'package:pharmacy_app/features/supplier_return_invoices/data/models/supplier_return_invoices_page.dart';

import 'supplier_return_invoice_repository.dart';

class SupplierReturnInvoiceRepositoryImpl
    implements SupplierReturnInvoiceRepository {
  SupplierReturnInvoiceRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, SupplierReturnInvoicesPage>> fetchReturns({
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.supplierReturnInvoices,
        queryParameters: queryParameters,
      );

      final returns = ApiParser.parseWrappedList(
        response.data,
        'data',
        SupplierReturnInvoiceModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        SupplierReturnInvoicesPage(
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
  Future<Either<Failure, SupplierReturnInvoiceModel>> fetchReturn(
    int id,
  ) async {
    try {
      final response =
          await api.get(ApiRoutes.supplierReturnInvoiceDetail(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierReturnInvoiceModel>> createReturn(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.supplierReturnInvoices,
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierReturnInvoiceModel>> cancelReturn(
    int id,
  ) async {
    try {
      final response =
          await api.patch(ApiRoutes.supplierReturnInvoiceCancel(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierReturnInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
