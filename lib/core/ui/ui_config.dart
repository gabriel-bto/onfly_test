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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff028AFF),
          titleTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 22,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
