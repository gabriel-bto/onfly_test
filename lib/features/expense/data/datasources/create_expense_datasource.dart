import '../../domain/entities/expense_entity.dart';

abstract class CreateExpenseDatasource {
  Future<bool> call(ExpenseEntity expenseEntity);
}
