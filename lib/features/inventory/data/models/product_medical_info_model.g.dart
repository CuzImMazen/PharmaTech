// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_medical_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMedicalInfoModel _$ProductMedicalInfoModelFromJson(
  Map<String, dynamic> json,
) => ProductMedicalInfoModel(
  id: (json['id'] as num?)?.toInt(),
  indications: json['indications'] as String?,
  contraindications: json['contraindications'] as String?,
  overdose: json['overdose'] as String?,
  pregnancySafety: json['pregnancy_safety'] as String?,
  lactationSafety: json['lactation_safety'] as String?,
  warnings: json['warnings'] as String?,
  sideEffects: json['side_effects'] as String?,
  drugInteractions: json['drug_interactions'] as String?,
  doseInfo: json['dose_info'] as String?,
);
