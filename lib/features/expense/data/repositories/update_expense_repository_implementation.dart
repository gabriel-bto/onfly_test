import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/update_expense_repository.dart';
import '../datasources/update_expense_datasource.dart';

class UpdateExpenseRepositoryImplementation implements UpdateExpenseRepository {
  final UpdateExpenseDatasource _expenseDatasource;

  UpdateExpenseRepositoryImplementation(this._expenseDatasource);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      return await _expenseDatasource(expenseEntity);
    } on Exception {
      throw Exception('Não foi possível atualizar a despesa');
    }
  }
}
