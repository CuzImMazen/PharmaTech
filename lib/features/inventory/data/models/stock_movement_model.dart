/// A single stock movement for a product. Mirrors the backend
/// `StockMovementResource` (`GET /stock-movements?product_id={id}`).
///
/// `quantity_change` is signed: positive for stock in (purchases, returns in,
/// adjustments in), negative for stock out (sales, returns out, adjustments out,
/// expiry).
///
/// Note: the backend nests `created_by` (UserResource) and `batch`
/// (StockBatchResource) as full objects. This model flattens them into a
/// friendly user name and a batch number, so [fromJson] is hand-written rather
/// than relying on json_serializable for those two fields.
class StockMovementModel {
  const StockMovementModel({
    required this.id,
    required this.productId,
    required this.movementType,
    required this.quantityChange,
    this.referenceType,
    this.referenceId,
    this.notes,
    this.createdBy,
    this.batchNumber,
    this.productName,
    this.productArName,
    required this.createdAt,
  });

  final int id;

  final int productId;

  final String movementType;

  final int quantityChange;

  final String? referenceType;
  final int? referenceId;

  final String? notes;

  /// Display name of the user who recorded the movement (flattened from the
  /// nested `created_by` UserResource).
  final String? createdBy;

  /// The batch number of the associated batch (flattened from the nested
  /// `batch` StockBatchResource), when the movement is tied to one.
  final String? batchNumber;

  /// The product's brand name (flattened from the nested `product`
  /// ProductResource). Only present when the backend eager-loads `product`
  /// (e.g. the pharmacy-wide `GET /stock-adjustments` log); the per-product
  /// movements tab leaves this null since the product is already known.
  final String? productName;

  /// The product's Arabic name, for RTL display. See [productName].
  final String? productArName;

  final String createdAt;

  factory StockMovementModel.fromJson(Map<String, dynamic> json) {
    return StockMovementModel(
      id: json['id'] as int,
      productId: json['product_id'] as int,
      movementType: json['movement_type'] as String,
      quantityChange: (json['quantity_change'] as num).toInt(),
      referenceType: json['reference_type'] as String?,
      referenceId: json['reference_id'] as int?,
      notes: json['notes'] as String?,
      createdBy: _extractUserName(json['created_by']),
      batchNumber: _extractBatchNumber(json['batch']),
      productName: _extractProductName(json['product'], 'brand_name'),
      productArName: _extractProductName(json['product'], 'ar_name'),
      createdAt: json['created_at'] as String,
    );
  }

  static String? _extractUserName(Object? user) {
    if (user is! Map<String, dynamic>) return null;
    final first = user['first_name'] as String? ?? '';
    final last = user['last_name'] as String? ?? '';
    final name = '$first $last'.trim();
    return name.isEmpty ? null : name;
  }

  static String? _extractBatchNumber(Object? batch) {
    if (batch is! Map<String, dynamic>) return null;
    return batch['batch_number'] as String?;
  }

  static String? _extractProductName(Object? product, String key) {
    if (product is! Map<String, dynamic>) return null;
    final name = product[key] as String?;
    return (name == null || name.isEmpty) ? null : name;
  }
}

/// Categorizes a movement as stock-in or stock-out for color/sign rendering.
enum StockMovementDirection { in_, out }

/// Movement-type helpers (mirrors the backend enum).
extension StockMovementTypeX on String {
  StockMovementDirection get direction => switch (this) {
        'purchase_in' ||
        'customer_return_in' ||
        'adjustment_in' =>
          StockMovementDirection.in_,
        'sale_out' ||
        'supplier_return_out' ||
        'adjustment_out' ||
        'expiry_out' =>
          StockMovementDirection.out,
        _ => StockMovementDirection.in_,
      };
}
