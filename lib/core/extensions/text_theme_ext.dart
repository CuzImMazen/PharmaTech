import 'package:flutter/material.dart';

extension TextThemeExt on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
}
