// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
  Map<String, dynamic> json,
) => ProductCategoryModel(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['description'] as String?,
);

Map<String, dynamic> _$ProductCategoryModelToJson(
  ProductCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
