import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;

  ScreenSize(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  double hp(double percent) => height * percent;
  double wp(double percent) => width * percent;

  double get shortestSide => MediaQuery.of(context).size.shortestSide;
}
