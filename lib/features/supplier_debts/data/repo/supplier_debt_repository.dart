import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debt_model.dart';
import 'package:pharmacy_app/features/supplier_debts/data/models/supplier_debts_page.dart';

/// Read-only data source for the Supplier Debts feature. Debts are created
/// server-side from `payment_method: debt` purchase invoices; there are no
/// create/update endpoints in scope.
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
}
