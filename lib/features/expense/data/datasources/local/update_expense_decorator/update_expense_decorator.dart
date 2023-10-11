import '../../../../domain/entities/expense_entity.dart';
import '../../update_expense_datasource.dart';

class UpdateExpenseDecorator implements UpdateExpenseDatasource {
  final UpdateExpenseDatasource _updateExpenseDatasource;

  UpdateExpenseDecorator(this._updateExpenseDatasource);

  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async =>
      await _updateExpenseDatasource(expenseEntity);
}
