import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/create_expense_repository.dart';
import '../datasources/create_expense_datasource.dart';

class CreateExpenseRepositoryImplementation implements CreateExpenseRepository {
  final CreateExpenseDatasource _createExpenseDatasource;

  CreateExpenseRepositoryImplementation(this._createExpenseDatasource);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async =>
      await _createExpenseDatasource(expenseEntity);
}
