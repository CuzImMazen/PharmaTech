import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_category.g.dart';

@JsonSerializable()
class ProductCategoryModel {
  ProductCategoryModel(this.id, this.name, this.description);

  final int id;
  final String name;
  final String? description; // API can return a null description occasionally

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
}
