import '../entities/expense_entity.dart';

abstract class CreateExpenseRepository {
  Future<bool> call(ExpenseEntity expenseEntity);
}
