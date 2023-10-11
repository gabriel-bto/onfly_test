import '../../domain/entities/expense_entity.dart';

abstract class CreateExpenseDatasource {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}
