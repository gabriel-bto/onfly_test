import 'package:onfly_test/features/expense/data/datasources/sync_expense_datasource.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../../../core/database/database.dart';
import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../presentation/Ui/models/expense_model.dart';
import '../../models/expense_model_extension.dart';

class SyncExpenseDatasourceImplementation implements SyncExpenseDatasource {
  final HttpClientImplementation _httpClientImplementation;
  SyncExpenseDatasourceImplementation(this._httpClientImplementation);

  late Database db;

  @override
  Future<void> call() async {
    db = await DB.istance.database;
    final result = await db.rawQuery('''
      SELECT * FROM expense 
      WHERE (isCreate = 1 OR isRemove = 1 OR isUpdate = 1)
    ''');

    final listExpenses = result.map((dbResult) {
      Map<String, Object?> json = {};

      json.addEntries(dbResult.entries);

      final expense = ExpenseModelExtension.fromJson(json);
      return ExpenseModel(
        id: json['idLocal'].toString(),
        isCreate: (json['isCreate'] == 1),
        isRemove: (json['isRemove'] == 1),
        isUpdate: (json['isUpdate'] == 1),
        description: expense.description,
        expenseDate: expense.expenseDate,
        amount: expense.amount,
        latitude: expense.latitude,
        longitude: expense.longitude,
      );
    }).toList();

    listExpenses.map((expense) async {
      if (expense.isCreate) {
        await _httpClientImplementation.post(
          ApiUtils.routeCreateExpense,
          queryParameters: expense.toJson(),
        );

        await db.update(
          'expense',
          {'isCreate': 0},
          where: 'idLocal = ?',
          whereArgs: [expense.id],
        );
      }

      if (expense.isUpdate) {
        await _httpClientImplementation.patch(
          ApiUtils.getRouteUpdateExpense(expense.id!),
          queryParameters: expense.toJson(),
        );

        await db.update(
          'expense',
          {'isUpdate': 0},
          where: 'idLocal = ?',
          whereArgs: [expense.id],
        );
      }

      if (expense.isRemove) {
        await _httpClientImplementation.delete(
          ApiUtils.getRouteRemoveExpense(expense.id!),
        );

        await db.delete(
          'expense',
          where: 'id = ?',
          whereArgs: [expense.id],
        );
      }
    });
  }
}
