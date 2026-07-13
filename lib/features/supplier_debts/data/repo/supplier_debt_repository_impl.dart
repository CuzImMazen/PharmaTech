import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debts_page.dart';

import 'supplier_debt_repository.dart';

class SupplierDebtRepositoryImpl implements SupplierDebtRepository {
  SupplierDebtRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, SupplierDebtsPage>> fetchDebts({
    int? supplierId,
    SupplierDebtStatus? status,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'supplier_id': supplierId,
        'status': status?.name,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.supplierDebts,
        queryParameters: queryParameters,
      );

      final debts = ApiParser.parseWrappedList(
        response.data,
        'data',
        SupplierDebtModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        SupplierDebtsPage(
          debts: debts,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? debts.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierDebtModel>> fetchDebt(int id) async {
    try {
      final response = await api.get(ApiRoutes.supplierDebtDetail(id));
      final debt = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierDebtModel.fromJson,
      );
      return Right(debt);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, SupplierDebtModel>> payDebt(
    int id, {
    required double amount,
    required String paymentDate,
    String? notes,
  }) async {
    try {
      final body = <String, dynamic>{
        'amount': amount,
        'payment_date': paymentDate,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      };
      final response = await api.post(
        ApiRoutes.supplierDebtPay(id),
        data: body,
      );
      final debt = ApiParser.parseWrapped(
        response.data,
        'data',
        SupplierDebtModel.fromJson,
      );
      return Right(debt);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
