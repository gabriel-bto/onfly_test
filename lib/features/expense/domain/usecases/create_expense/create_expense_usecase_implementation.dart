import '../../entities/expense_entity.dart';
import '../../repositories/create_expense_repository.dart';
import 'create_expense_usecase.dart';

class CreateExpenseUsecaseImplementation implements CreateExpenseUsecase {
  final CreateExpenseRepository _createExpenseRepository;

  CreateExpenseUsecaseImplementation(this._createExpenseRepository);

  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    return await _createExpenseRepository(expenseEntity);
  }
}
