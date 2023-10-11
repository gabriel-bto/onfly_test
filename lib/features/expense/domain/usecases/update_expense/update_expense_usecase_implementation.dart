import '../../entities/expense_entity.dart';
import '../../repositories/update_expense_repository.dart';
import 'update_expense_usecase.dart';

class UpdateExpenseUsecaseImplementation implements UpdateExpenseUsecase {
  final UpdateExpenseRepository _updateExpenseRepository;

  UpdateExpenseUsecaseImplementation(this._updateExpenseRepository);

  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    return _updateExpenseRepository(expenseEntity);
  }
}
