import 'package:onfly_test/app/core/database/sqlite_connection_factory.dart';

import '../../../../domain/entities/expense_entity.dart';
import 'update_expense_decorator.dart';

class UpdateExpenseDecoratorImplementation extends UpdateExpenseDecorator {
  UpdateExpenseDecoratorImplementation(super.updateExpenseDatasource);

  final _connectionFactory = SqliteConnectionFactory();

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      await super(expenseEntity);
      await _updateInLocal(expenseEntity);
      return true;
    } catch (_) {
      await _updateInLocal(expenseEntity);
      return true;
    }
  }

  Future<bool> _updateInLocal(ExpenseEntity expenseEntity) async {
    final connection = await _connectionFactory.openConnection();

    await connection.rawUpdate('''
        update expense 
        set description = ?, expenseDate = ?, amount = ?, latitude = ?, longitude = ? 
        WHERE id = ?
        ''', [
      expenseEntity.description,
      expenseEntity.expenseDate,
      expenseEntity.amount,
      expenseEntity.latitude,
      expenseEntity.longitude,
      expenseEntity.id,
    ]);

    return true;
  }
}
