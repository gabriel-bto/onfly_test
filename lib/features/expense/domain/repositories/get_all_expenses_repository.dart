import '../entities/expense_entity.dart';

abstract class GetAllExpensesRepository {
  Future<List<ExpenseEntity>> call();
}