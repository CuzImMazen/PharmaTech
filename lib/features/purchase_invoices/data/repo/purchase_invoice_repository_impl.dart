import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoice_model.dart';
import 'package:pharmacy_app/features/purchase_invoices/data/models/purchase_invoices_page.dart';

import 'purchase_invoice_repository.dart';

class PurchaseInvoiceRepositoryImpl implements PurchaseInvoiceRepository {
  PurchaseInvoiceRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, PurchaseInvoicesPage>> fetchInvoices({
    int? supplierId,
    InvoiceStatus? status,
    InvoicePaymentStatus? paymentStatus,
    String? fromDate,
    String? toDate,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'supplier_id': supplierId,
        'status': status?.name,
        'payment_status': paymentStatus?.name,
        'from_date': fromDate,
        'to_date': toDate,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.purchaseInvoices,
        queryParameters: queryParameters,
      );

      final invoices = ApiParser.parseWrappedList(
        response.data,
        'data',
        PurchaseInvoiceModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        PurchaseInvoicesPage(
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
  Future<Either<Failure, PurchaseInvoiceModel>> fetchInvoice(int id) async {
    try {
      final response = await api.get(ApiRoutes.purchaseInvoiceDetail(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        PurchaseInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceModel>> createInvoice(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.purchaseInvoices,
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        PurchaseInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceModel>> updateInvoiceNotes(
    int id,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await api.put(
        ApiRoutes.purchaseInvoiceDetail(id),
        data: body,
      );
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        PurchaseInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, PurchaseInvoiceModel>> cancelInvoice(int id) async {
    try {
      final response = await api.patch(ApiRoutes.purchaseInvoiceCancel(id));
      final invoice = ApiParser.parseWrapped(
        response.data,
        'data',
        PurchaseInvoiceModel.fromJson,
      );
      return Right(invoice);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
