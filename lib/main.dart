import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/inject/inject.dart';
import 'core/ui/ui_config.dart';
import 'features/expense/presentation/Ui/pages/expense_page.dart';

void main() {
  Inject.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: UiConfig.theme,
      home: const ExpensePage(),
    ),
  );
}
