import '../../domain/entities/expense_entity.dart';

abstract class UpdateExpenseDatasource {
  Future<bool> call(ExpenseEntity expenseEntity);
}
