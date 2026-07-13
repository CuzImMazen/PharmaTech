import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoice_model.dart';
import 'package:pharmacy_app/features/sales_invoices/data/models/sales_invoices_page.dart';

import 'sales_invoice_repository.dart';

class SalesInvoiceRepositoryImpl implements SalesInvoiceRepository {
  SalesInvoiceRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, SalesInvoicesPage>> fetchSalesInvoices({
    int? customerId,
    InvoiceStatus? status,
    InvoicePaymentStatus? paymentStatus,
    String? fromDate,
    String? toDate,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'customer_id': customerId,
        'status': status?.name,
        'payment_status': paymentStatus?.name,
        'date_from': fromDate,
        'date_to': toDate,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.salesInvoices,
        queryParameters: queryParameters,
      );

      final invoices = ApiParser.parseWrappedList(
        response.data,
        'data',
        SalesInvoiceModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        SalesInvoicesPage(
          invoices: invoices,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? invoices.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceModel>> fetchSalesInvoice(int id) async {
    try {
      final response = await api.get(ApiRoutes.salesInvoiceDetail(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SalesInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceModel>> createSalesInvoice(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.salesInvoices,
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SalesInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceModel>> updateSalesInvoiceNotes(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.put(
        ApiRoutes.salesInvoiceDetail(id),
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SalesInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SalesInvoiceModel>> cancelSalesInvoice(int id) async {
    try {
      final response = await api.patch(ApiRoutes.salesInvoiceCancel(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        SalesInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
