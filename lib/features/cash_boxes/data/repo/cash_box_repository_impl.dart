import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transactions_page.dart';

import 'cash_box_repository.dart';

class CashBoxRepositoryImpl implements CashBoxRepository {
  CashBoxRepositoryImpl({required this.api});

  final DioApiHelper api;

  @override
  Future<Either<Failure, CashBoxModel>> fetchCashBox() async {
    try {
      final response = await api.get(ApiRoutes.cashBoxes);
      final box = ApiParser.parseWrapped(
        response.data,
        'data',
        CashBoxModel.fromJson,
      );
      return Right(box);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CashBoxModel>> createCashBox(
    double openingBalance,
  ) async {
    try {
      final response = await api.post(
        ApiRoutes.cashBoxes,
        data: {'opening_balance': openingBalance},
      );
      final box = ApiParser.parseWrapped(
        response.data,
        'data',
        CashBoxModel.fromJson,
      );
      return Right(box);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CashTransactionsPage>> fetchTransactions({
    CashTransactionType? transactionType,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'transaction_type': transactionType?.backendValue,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null);

      final response = await api.get(
        ApiRoutes.cashBoxTransactions,
        queryParameters: queryParameters,
      );

      final transactions = ApiParser.parseWrappedList(
        response.data,
        'data',
        CashTransactionModel.fromJson,
      );

      final meta = response.data is Map<String, dynamic>
          ? response.data['meta'] as Map<String, dynamic>?
          : null;

      return Right(
        CashTransactionsPage(
          transactions: transactions,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? page,
          total: (meta?['total'] as num?)?.toInt() ?? transactions.length,
        ),
      );
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
