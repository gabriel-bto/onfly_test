import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/sync_decorator/sync_expense_datasource_implementation.dart';

class SyncController extends WidgetsBindingObserver {
  final SyncExpenseDatasourceImplementation
      _syncExpenseDatasourceImplementation;

  SyncController(this._syncExpenseDatasourceImplementation) {
    listeningConnectivy = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!(result == ConnectivityResult.none)) {
        _syncExpenseDatasourceImplementation();
      }
    });
  }

  late StreamSubscription<ConnectivityResult> listeningConnectivy;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state.index) {
      case 0:
        listeningConnectivy.cancel();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
