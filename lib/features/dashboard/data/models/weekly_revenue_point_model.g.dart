// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_revenue_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyRevenuePointModel _$WeeklyRevenuePointModelFromJson(
  Map<String, dynamic> json,
) => WeeklyRevenuePointModel(
  date: json['date'] as String,
  day: json['day'] as String,
  revenue: WeeklyRevenuePointModel._revenueFromJson(json['revenue']),
  isToday: json['is_today'] as bool,
);
