import '../../entities/expense_entity.dart';

abstract class CreateExpenseUsecase {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}