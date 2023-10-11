import '../../../presentation/Ui/models/expense_model.dart';

abstract class GetAllExpensesUsecase {
  Future<List<ExpenseModel>> call();
}
