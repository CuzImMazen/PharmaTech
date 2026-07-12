import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';
import 'package:pharmacy_app/features/customers/data/models/customers_page.dart';

/// Data source for the Customers feature.
abstract class CustomerRepository {
  /// Paginated list of the pharmacy's customers. `withTrashed` includes
  /// soft-deleted rows (backend `with_trashed=1`). `search` matches
  /// full_name/phone.
  Future<Either<Failure, CustomersPage>> fetchCustomers({
    String? search,
    bool withTrashed = false,
    int page = 1,
    int perPage = 15,
  });

  Future<Either<Failure, CustomerModel>> fetchCustomer(int id);

  /// Creates a customer. [body] is the snake_case payload:
  /// `{full_name, phone?, notes?}`.
  Future<Either<Failure, CustomerModel>> createCustomer(
    Map<String, dynamic> body,
  );

  /// Updates a customer. [body] uses `sometimes`-style fields.
  Future<Either<Failure, CustomerModel>> updateCustomer(
    int id,
    Map<String, dynamic> body,
  );

  /// Soft-deletes a customer. Idempotent on the backend.
  Future<Either<Failure, void>> deleteCustomer(int id);

  /// Restores a soft-deleted customer.
  Future<Either<Failure, CustomerModel>> restoreCustomer(int id);
}
