import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/create_expense_repository.dart';

class CreateExpenseRepositoryImplementation implements CreateExpenseRepository {
  @override
  Future<bool> call(ExpenseEntity expenseEntity) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
