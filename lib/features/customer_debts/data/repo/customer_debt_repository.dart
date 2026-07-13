import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debt_model.dart';
import 'package:pharmacy_app/features/customer_debts/data/models/customer_debts_page.dart';

/// Data source for the Customer Debts feature. Debts are created server-side
/// from `payment_method: debt` sales invoices; the only mutation in scope is
/// recording a payment (`POST /customer-debts/{id}/pay`).
abstract class CustomerDebtRepository {
  /// Paginated list of the pharmacy's customer debts. `customerId` filters by
  /// customer; `status` filters by one of the debt status values.
  Future<Either<Failure, CustomerDebtsPage>> fetchDebts({
    int? customerId,
    CustomerDebtStatus? status,
    int page = 1,
    int perPage = 15,
  });

  /// Single debt with its `payments[]` loaded (eager-loaded on the backend).
  Future<Either<Failure, CustomerDebtModel>> fetchDebt(int id);

  /// Records a payment against the debt. Returns the updated debt (with its
  /// payments list). The backend validates `amount` ≤ `remaining_amount` and
  /// rejects if the debt is `paid`/`cancelled`.
  Future<Either<Failure, CustomerDebtModel>> payDebt(
    int id, {
    required double amount,
    required String paymentDate,
    String? notes,
  });
}
