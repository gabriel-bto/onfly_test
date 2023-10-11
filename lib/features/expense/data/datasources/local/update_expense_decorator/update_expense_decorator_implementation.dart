import 'package:onfly_test/features/expense/data/models/expense_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import 'update_expense_decorator.dart';

class UpdateExpenseDecoratorImplementation extends UpdateExpenseDecorator {
  UpdateExpenseDecoratorImplementation(super.updateExpenseDatasource);

  late Database db;

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      await super(expenseEntity);
      await _updateInLocal(expenseEntity);
      return true;
    } catch (_) {
      await _updateInLocalCache(expenseEntity);
      return true;
    }
  }

  Future<bool> _updateInLocal(ExpenseEntity expenseEntity) async {
    db = await DB.istance.database;

    await db.update(
      'expense',
      expenseEntity.toJson(),
    );

    return true;
  }

  Future<bool> _updateInLocalCache(ExpenseEntity expenseEntity) async {
    await _updateInLocal(expenseEntity);

    db = await DB.istance.database;

    await db.update(
      'expense',
      {'isUpdate': 1},
    );

    return true;
  }
}
