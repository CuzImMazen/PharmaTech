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

Map<String, dynamic> _$ProductMedicalInfoModelToJson(
  ProductMedicalInfoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'indications': instance.indications,
  'contraindications': instance.contraindications,
  'overdose': instance.overdose,
  'pregnancy_safety': instance.pregnancySafety,
  'lactation_safety': instance.lactationSafety,
  'warnings': instance.warnings,
  'side_effects': instance.sideEffects,
  'drug_interactions': instance.drugInteractions,
  'dose_info': instance.doseInfo,
};
