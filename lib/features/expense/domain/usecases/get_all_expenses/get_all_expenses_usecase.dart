import '../../entities/expense_entity.dart';

abstract class GetAllExpensesUsecase {
  Future<List<ExpenseEntity>> call();
}
