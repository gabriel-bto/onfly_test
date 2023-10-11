import 'package:flutter/material.dart';
import 'package:onfly_test/features/expense/presentaton/Ui/pages/expense_page.dart';

import 'core/inject/inject.dart';

void main() {
  Inject.init();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExpensePage(),
  ));
}
