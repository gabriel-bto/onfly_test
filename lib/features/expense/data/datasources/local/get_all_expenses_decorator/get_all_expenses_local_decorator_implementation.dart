import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../presentation/Ui/models/expense_model.dart';
import '../../../models/expense_model_extension.dart';
import 'get_all_expenses_local_decorator.dart';

class GetAllExpensesLocalDecoratorImplementation
    extends GetAllExpensesLocalDecorator {
  GetAllExpensesLocalDecoratorImplementation(super.getAllExpensesDatasource);

  late Database db;

  @override
  Future<List<ExpenseModel>> call() async {
    try {
      return await super();
    } catch (_) {
      return _getInLocal();
    }
  }

  Future<List<ExpenseModel>> _getInLocal() async {
    db = await DB.istance.database;

    final result = await db.query(
      'expense',
      where: 'isRemove = ?',
      whereArgs: [0],
    );

    return result.map((dbResult) {
      Map<String, Object?> json = {};

      json.addEntries(dbResult.entries);

      final expense = ExpenseModelExtension.fromJson(json);
      return ExpenseModel(
        id: json['idLocal'].toString(),
        isCreate: (json['isCreate'] == 1),
        isUpdate: (json['isUpdate'] == 1),
        description: expense.description,
        expenseDate: expense.expenseDate,
        amount: expense.amount,
        latitude: expense.latitude,
        longitude: expense.longitude,
      );
    }).toList();
  }
}
