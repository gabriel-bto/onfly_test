import '../entities/expense_entity.dart';

abstract class UpdateExpenseRepository {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}
