import '../../../../domain/entities/expense_entity.dart';
import '../../create_expense_datasource.dart';

class CreateExpenseLocalDecorator implements CreateExpenseDatasource {
  final CreateExpenseDatasource _getAllExpensesDatasource;
  CreateExpenseLocalDecorator(this._getAllExpensesDatasource);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async =>
      await _getAllExpensesDatasource(expenseEntity);
}
