import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debts_page.dart';

/// Data source for the Supplier Debts feature. Debts are created server-side
/// from `payment_method: debt` purchase invoices; the only mutation in scope
/// is recording a payment (`POST /supplier-debts/{id}/pay`).
abstract class SupplierDebtRepository {
  /// Paginated list of the pharmacy's supplier debts. `supplierId` filters by
  /// supplier; `status` filters by one of the debt status values.
  Future<Either<Failure, SupplierDebtsPage>> fetchDebts({
    int? supplierId,
    SupplierDebtStatus? status,
    int page = 1,
    int perPage = 15,
  });

  /// Single debt with its `payments[]` loaded (eager-loaded on the backend).
  Future<Either<Failure, SupplierDebtModel>> fetchDebt(int id);

  /// Records a payment against the debt. Returns the updated debt (with its
  /// payments list). The backend validates `amount` ≤ `remaining_amount` and
  /// rejects if the debt is `paid`/`cancelled`.
  Future<Either<Failure, SupplierDebtModel>> payDebt(
    int id, {
    required double amount,
    required String paymentDate,
    String? notes,
  });
}
