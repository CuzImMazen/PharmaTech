import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_unit_model.g.dart';

@JsonSerializable()
class BaseUnitModel {
  BaseUnitModel({required this.id, required this.name, required this.type});

  final int id;
  final String name;
  final String type;

  factory BaseUnitModel.fromJson(Map<String, dynamic> json) =>
      _$BaseUnitModelFromJson(json);
}
