import 'package:onfly_test/features/expense/data/models/expense_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import 'create_expense_local_decorator.dart';

class CreateExpenseLocalDecoratorImplementation
    extends CreateExpenseLocalDecorator {
  CreateExpenseLocalDecoratorImplementation(super.createExpensesDatasource);

  late Database db;

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      await super(expenseEntity);
      await _createInLocal(expenseEntity);
      return true;
    } catch (_) {
      return _createInLocalWithCache(expenseEntity);
    }
  }

  Future<bool> _createInLocal(ExpenseEntity expenseEntity) async {
    db = await DB.istance.database;

    final result = await db.insert(
      'expense',
      expenseEntity.toJson(),
    );

    return result > 0;
  }

  Future<bool> _createInLocalWithCache(ExpenseEntity expenseEntity) async {
    await _createInLocal(expenseEntity);

    db = await DB.istance.database;

    final result = await db.update(
      'expense',
      {'isCreate': 1},
      where: 'id = ?',
      whereArgs: [expenseEntity.id],
    );

    return result > 0;
  }
}
