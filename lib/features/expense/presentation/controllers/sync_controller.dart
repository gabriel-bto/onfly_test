import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/datasources/sync_decorator/sync_expense_datasource_implementation.dart';

class SyncController extends ChangeNotifier {
  final SyncExpenseDatasourceImplementation
      _syncExpenseDatasourceImplementation;

  bool isOnline = false;

  SyncController(this._syncExpenseDatasourceImplementation) {
    init();
    addListener(() async {
      if (!isOnline) return;

      await _syncExpenseDatasourceImplementation();
    });
  }

  void init() {
    Timer.periodic(const Duration(seconds: 60), (timer) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } on Exception {
        isOnline = false;
      } finally {
        notifyListeners();
      }
    });
  }
}
