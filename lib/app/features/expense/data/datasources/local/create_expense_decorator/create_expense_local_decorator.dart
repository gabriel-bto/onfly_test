import '../../../../domain/entities/expense_entity.dart';
import '../../create_expense_datasource.dart';

class CreateExpenseLocalDecorator implements CreateExpenseDatasource {
  final CreateExpenseDatasource _createExpensesDatasource;
  CreateExpenseLocalDecorator(this._createExpensesDatasource);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async =>
      await _createExpensesDatasource(expenseEntity);
}
