import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static get theme => ThemeData(
        primaryColor: const Color(0xff028AFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff028AFF),
          ),
        ),
      );
}
