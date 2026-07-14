// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_box_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashBoxStatisticsModel _$CashBoxStatisticsModelFromJson(
  Map<String, dynamic> json,
) => CashBoxStatisticsModel(
  today: CashBoxPeriodStatistics.fromJson(
    json['today'] as Map<String, dynamic>,
  ),
  week: CashBoxPeriodStatistics.fromJson(json['week'] as Map<String, dynamic>),
  month: CashBoxPeriodStatistics.fromJson(
    json['month'] as Map<String, dynamic>,
  ),
);

CashBoxPeriodStatistics _$CashBoxPeriodStatisticsFromJson(
  Map<String, dynamic> json,
) => CashBoxPeriodStatistics(
  inAmount: (json['in'] as num).toDouble(),
  outAmount: (json['out'] as num).toDouble(),
);
