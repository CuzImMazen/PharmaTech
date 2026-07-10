import 'package:json_annotation/json_annotation.dart';

part 'product_medical_info_model.g.dart';

/// Medical info for a product. Mirrors the backend
/// `ProductMedicalInfoResource` (`GET /products/{id}/medical-info`).
///
/// Every field is nullable. The standalone endpoint returns `{"data": null}`
/// (HTTP 200) when no row exists, so [fromJson] must tolerate a `null` input.
@JsonSerializable()
class ProductMedicalInfoModel {
  const ProductMedicalInfoModel({
    this.id,
    this.indications,
    this.contraindications,
    this.overdose,
    this.pregnancySafety,
    this.lactationSafety,
    this.warnings,
    this.sideEffects,
    this.drugInteractions,
    this.doseInfo,
  });

  final int? id;

  final String? indications;
  final String? contraindications;
  final String? overdose;

  @JsonKey(name: 'pregnancy_safety')
  final String? pregnancySafety;

  @JsonKey(name: 'lactation_safety')
  final String? lactationSafety;

  final String? warnings;

  @JsonKey(name: 'side_effects')
  final String? sideEffects;

  @JsonKey(name: 'drug_interactions')
  final String? drugInteractions;

  @JsonKey(name: 'dose_info')
  final String? doseInfo;

  /// Whether this instance carries any actual content. Used by the UI to
  /// decide between the populated layout and the empty state.
  bool get isEmpty =>
      indications == null &&
      contraindications == null &&
      overdose == null &&
      pregnancySafety == null &&
      lactationSafety == null &&
      warnings == null &&
      sideEffects == null &&
      drugInteractions == null &&
      doseInfo == null;

  factory ProductMedicalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductMedicalInfoModelFromJson(json);

  /// Tolerant factory: the backend returns `{"data": null}` when there is no
  /// medical info row. Parse that to `null` instead of throwing.
  static ProductMedicalInfoModel? fromJsonOrNull(Object? json) {
    if (json == null) return null;
    if (json is Map<String, dynamic>) {
      return ProductMedicalInfoModel.fromJson(json);
    }
    return null;
  }
}
