import 'package:json_annotation/json_annotation.dart';

part 'stock_batch_model.g.dart';

/// A single inventory batch for a product. Mirrors the backend
/// `StockBatchResource` (`GET /products/{id}/batches/available`).
@JsonSerializable()
class StockBatchModel {
  const StockBatchModel({
    required this.id,
    required this.productId,
    required this.batchNumber,
    this.expiryDate,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.quantityOnHand,
    required this.receivedAt,
    this.status = StockBatchStatus.active,
  });

  final int id;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'batch_number')
  final String batchNumber;

  /// ISO date string `YYYY-MM-DD` (nullable).
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;

  @JsonKey(name: 'purchase_price')
  final num purchasePrice;

  @JsonKey(name: 'selling_price')
  final num sellingPrice;

  @JsonKey(name: 'quantity_on_hand')
  final int quantityOnHand;

  /// ISO-8601 datetime string.
  @JsonKey(name: 'received_at')
  final String receivedAt;

  final StockBatchStatus status;

  factory StockBatchModel.fromJson(Map<String, dynamic> json) =>
      _$StockBatchModelFromJson(json);
}

/// Backend enum values: `active` | `expired` | `depleted` | `inactive`.
enum StockBatchStatus {
  active,
  expired,
  depleted,
  inactive;

  static StockBatchStatus fromString(String? value) {
    return StockBatchStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => StockBatchStatus.active,
    );
  }
}
