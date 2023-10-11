import '../entities/expense_entity.dart';

abstract class UpdateExpenseRepository {
  Future<bool> call(ExpenseEntity expenseEntity);
}
