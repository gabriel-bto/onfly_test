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
    final result = await db.query('expense');
    final listExpenses = result.map((json) {
      final expense = ExpenseModelExtension.fromJson(json);
      return ExpenseModel(
        isCreate: json['isCreate'] as bool,
        isRemove: json['isRemove'] as bool,
        isUpdate: json['isUpdate'] as bool,
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
      }

      if (expense.isUpdate) {
        await _httpClientImplementation.patch(
          ApiUtils.getRouteUpdateExpense(expense.id!),
          queryParameters: expense.toJson(),
        );
      }

      if (expense.isRemove) {
        await _httpClientImplementation.get(
          ApiUtils.getRouteRemoveExpense(expense.id!),
        );
      }
    });
  }
}
