import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get scaffoldBackgroundColor => const Color(0xFFF1F1F1);
  TextTheme get textTheme => Theme.of(this).textTheme;
}
