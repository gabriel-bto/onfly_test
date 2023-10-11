import '../../entities/expense_entity.dart';

abstract class UpdateExpenseUsecase {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}