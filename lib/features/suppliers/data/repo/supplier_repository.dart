import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';
import 'package:pharmacy_app/features/suppliers/data/models/suppliers_page.dart';

/// Data source for the Suppliers feature.
abstract class SupplierRepository {
  /// Paginated list of the pharmacy's suppliers. `withTrashed` includes
  /// soft-deleted rows (backend `with_trashed=1`). `search` matches
  /// name/phone/email.
  Future<Either<Failure, SuppliersPage>> fetchSuppliers({
    String? search,
    bool withTrashed = false,
    int page = 1,
    int perPage = 15,
  });

  Future<Either<Failure, SupplierModel>> fetchSupplier(int id);

  /// Creates a supplier. [body] is the snake_case payload:
  /// `{name, company_id?, phone?, email?, address?, notes?}`.
  Future<Either<Failure, SupplierModel>> createSupplier(
    Map<String, dynamic> body,
  );

  /// Updates a supplier. [body] uses `sometimes`-style fields.
  Future<Either<Failure, SupplierModel>> updateSupplier(
    int id,
    Map<String, dynamic> body,
  );

  /// Soft-deletes a supplier. Idempotent on the backend.
  Future<Either<Failure, void>> deleteSupplier(int id);

  /// Restores a soft-deleted supplier.
  Future<Either<Failure, SupplierModel>> restoreSupplier(int id);
}
