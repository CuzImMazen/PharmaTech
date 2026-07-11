import 'package:json_annotation/json_annotation.dart';
part 'base_unit_model.g.dart';

@JsonSerializable()
class BaseUnitModel {
  BaseUnitModel({required this.id, required this.name, required this.type});

  final int id;
  final String name;
  final String type;

  factory BaseUnitModel.fromJson(Map<String, dynamic> json) =>
      _$BaseUnitModelFromJson(json);

  /// Value equality by [id] so [DropdownButton] can match a pre-selected
  /// instance against a freshly-fetched options list.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseUnitModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
