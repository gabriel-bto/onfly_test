import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/create_expense_repository.dart';
import '../datasources/create_expense_datasource.dart';

class CreateExpenseRepositoryImplementation implements CreateExpenseRepository {
  final CreateExpenseDatasource _createExpenseDatasource;

  CreateExpenseRepositoryImplementation(this._createExpenseDatasource);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      return await _createExpenseDatasource(expenseEntity);
    } on Exception {
      throw Exception('Não foi possível criar a despesa');
    }
  }
}
