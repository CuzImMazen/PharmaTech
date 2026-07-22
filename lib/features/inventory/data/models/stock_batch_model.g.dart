// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockBatchModel _$StockBatchModelFromJson(Map<String, dynamic> json) =>
    StockBatchModel(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      batchNumber: json['batch_number'] as String,
      expiryDate: json['expiry_date'] as String?,
      purchasePrice: json['purchase_price'] as num,
      sellingPrice: json['selling_price'] as num,
      quantityOnHand: (json['quantity_on_hand'] as num).toInt(),
      receivedAt: json['received_at'] as String,
      status:
          $enumDecodeNullable(_$StockBatchStatusEnumMap, json['status']) ??
          StockBatchStatus.active,
    );

const _$StockBatchStatusEnumMap = {
  StockBatchStatus.active: 'active',
  StockBatchStatus.expired: 'expired',
  StockBatchStatus.depleted: 'depleted',
  StockBatchStatus.inactive: 'inactive',
};
