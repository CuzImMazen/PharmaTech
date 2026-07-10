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

Map<String, dynamic> _$StockBatchModelToJson(StockBatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'quantity_on_hand': instance.quantityOnHand,
      'received_at': instance.receivedAt,
      'status': _$StockBatchStatusEnumMap[instance.status]!,
    };

const _$StockBatchStatusEnumMap = {
  StockBatchStatus.active: 'active',
  StockBatchStatus.expired: 'expired',
  StockBatchStatus.depleted: 'depleted',
  StockBatchStatus.inactive: 'inactive',
};
