import 'package:json_annotation/json_annotation.dart';

part 'weekly_revenue_point_model.g.dart';

@JsonSerializable(createToJson: false)
class WeeklyRevenuePointModel {
  const WeeklyRevenuePointModel({
    required this.date,
    required this.day,
    required this.revenue,
    required this.isToday,
  });

  final String date;
  final String day;

  // 1. Read it dynamically using a safe converter function
  @JsonKey(fromJson: _revenueFromJson)
  final double revenue;

  @JsonKey(name: 'is_today')
  final bool isToday;

  factory WeeklyRevenuePointModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyRevenuePointModelFromJson(json);

  // 2. This helper safely converts integers (like 150) or doubles (like 150.5) smoothly
  static double _revenueFromJson(dynamic val) => (val as num).toDouble();
}
