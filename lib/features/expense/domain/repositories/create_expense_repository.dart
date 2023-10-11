import '../entities/expense_entity.dart';

abstract class CreateExpenseRepository {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}
