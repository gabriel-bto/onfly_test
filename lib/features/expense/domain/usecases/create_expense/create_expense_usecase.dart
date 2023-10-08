import '../../entities/expense_entity.dart';

abstract class CreateExpenseUsecase {
  Future<bool> call(ExpenseEntity expenseEntity);
}