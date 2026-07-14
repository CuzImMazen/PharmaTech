import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_box_statistics_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transaction_model.dart';
import 'package:pharmacy_app/features/cash_boxes/data/models/cash_transactions_page.dart';

/// Data source for the Cash Boxes feature. The backend exposes one box per
/// pharmacy: `GET /cash-boxes` returns 404 when none exists yet, `POST`
/// creates it (rejects if one already exists), and transactions are listed
/// separately.
abstract class CashBoxRepository {
  /// Fetches the pharmacy's cash box. Returns `Left(Failure)` on 404 (no box
  /// yet) — the UI treats that as the "create a cash box" setup state.
  Future<Either<Failure, CashBoxModel>> fetchCashBox();

  /// Creates the cash box with [openingBalance]. Fails with 422 if a box
  /// already exists (enforced per-pharmacy on the backend).
  Future<Either<Failure, CashBoxModel>> createCashBox(double openingBalance);

  /// Fetches income/outcome totals for today, week and month.
  Future<Either<Failure, CashBoxStatisticsModel>> fetchStatistics();

  /// Paginated list of the box's transactions. `transactionType` filters by
  /// one of the 8 movement types; `fromDate`/`toDate` are inclusive ISO date
  /// strings (`YYYY-MM-DD`) sent as `date_from`/`date_to`.
  Future<Either<Failure, CashTransactionsPage>> fetchTransactions({
    CashTransactionType? transactionType,
    String? fromDate,
    String? toDate,
    int page = 1,
    int perPage = 15,
  });
}
