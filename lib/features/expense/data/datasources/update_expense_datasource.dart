import '../../domain/entities/expense_entity.dart';

abstract class UpdateExpenseDatasource {
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity);
}
