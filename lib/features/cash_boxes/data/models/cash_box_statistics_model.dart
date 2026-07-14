import 'package:json_annotation/json_annotation.dart';

part 'cash_box_statistics_model.g.dart';

/// Cash-box income/outcome totals for the periods exposed by
/// `GET /cash-boxes/statistics`.
///
/// Response shape:
/// {
///   "today": {"in": 1234.50, "out": 567.00},
///   "week":  {"in": ..., "out": ...},
///   "month": {"in": ..., "out": ...}
/// }
@JsonSerializable(createToJson: false)
class CashBoxStatisticsModel {
  const CashBoxStatisticsModel({
    required this.today,
    required this.week,
    required this.month,
  });

  final CashBoxPeriodStatistics today;
  final CashBoxPeriodStatistics week;
  final CashBoxPeriodStatistics month;

  factory CashBoxStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxStatisticsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CashBoxPeriodStatistics {
  const CashBoxPeriodStatistics({
    @JsonKey(name: 'in') required this.inAmount,
    @JsonKey(name: 'out') required this.outAmount,
  });

  final double inAmount;
  final double outAmount;

  factory CashBoxPeriodStatistics.fromJson(Map<String, dynamic> json) =>
      _$CashBoxPeriodStatisticsFromJson(json);
}
