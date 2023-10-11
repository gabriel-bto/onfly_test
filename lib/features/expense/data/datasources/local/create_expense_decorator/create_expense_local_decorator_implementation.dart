import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import 'create_expense_local_decorator.dart';

class CreateExpenseLocalDecoratorImplementation
    extends CreateExpenseLocalDecorator {
  CreateExpenseLocalDecoratorImplementation(super.createExpensesDatasource);

  late Database db;

  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    try {
      final newExpense = await super(expenseEntity);
      return await _createInLocal(newExpense);
    } on Exception {
      return await _createInLocalWithCache(expenseEntity);
    }
  }

  Future<ExpenseEntity> _createInLocal(ExpenseEntity expenseEntity) async {
    db = await DB.istance.database;

    await db.rawInsert(
      '''INSERT INTO expense(id, description, expenseDate, amount, latitude, longitude) 
      VALUES(?, ?, ?, ?, ?, ?)''',
      [
        expenseEntity.id,
        expenseEntity.description,
        expenseEntity.expenseDate.toUtc(),
        expenseEntity.amount,
        expenseEntity.latitude,
        expenseEntity.longitude,
      ],
    );

    return expenseEntity;
  }

  Future<ExpenseEntity> _createInLocalWithCache(ExpenseEntity expenseEntity) async {
    db = await DB.istance.database;

    await db.rawInsert(
      '''INSERT INTO expense(idLocal, description, expenseDate, amount, latitude, longitude, isCreate) 
      VALUES(?, ?, ?, ?, ?, ?, ?)''',
      [
        DateTime.now().millisecondsSinceEpoch.toString(),
        expenseEntity.description,
        expenseEntity.expenseDate.toUtc().toString(),
        expenseEntity.amount,
        expenseEntity.latitude,
        expenseEntity.longitude,
        1,
      ],
    );

    return expenseEntity;
  }
}
