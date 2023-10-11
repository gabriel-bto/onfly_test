import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import 'update_expense_decorator.dart';

class UpdateExpenseDecoratorImplementation extends UpdateExpenseDecorator {
  UpdateExpenseDecoratorImplementation(super.updateExpenseDatasource);

  late Database db;

  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    try {
      var result = await super(expenseEntity);
      return await _updateInLocal(result);
    } catch (_) {
      return await _updateInLocalCache(expenseEntity);
    }
  }

  Future<ExpenseEntity> _updateInLocal(ExpenseEntity expenseEntity) async {
    db = await DB.istance.database;

    await db.rawUpdate('''
      UPDATE expense
      SET description = ?, expenseDate = ?, description = ?, expenseDate = ?, expenseDate = ? WHERE id = ?
    ''', [
      expenseEntity.description,
      expenseEntity.expenseDate.toIso8601String(),
      expenseEntity.amount,
      expenseEntity.latitude,
      expenseEntity.longitude,
      int.tryParse(expenseEntity.id ?? ''),
    ]);

    return expenseEntity;
  }

  Future<ExpenseEntity> _updateInLocalCache(ExpenseEntity expenseEntity) async {
    await _updateInLocal(expenseEntity);

    db = await DB.istance.database;

    await db.rawUpdate('''
      UPDATE expense
      SET isUpdate = ?, description = ?, expenseDate = ?, amount = ?, latitude = ?, longitude = ? WHERE idLocal = ?
    ''', [
      1,
      expenseEntity.description,
      expenseEntity.expenseDate.toUtc().toString(),
      expenseEntity.amount,
      expenseEntity.latitude,
      expenseEntity.longitude,
      int.tryParse(expenseEntity.id ?? ''),
    ]);

    return expenseEntity;
  }
}
