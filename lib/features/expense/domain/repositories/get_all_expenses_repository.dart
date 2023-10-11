import '../../presentation/Ui/models/expense_model.dart';

abstract class GetAllExpensesRepository {
  Future<List<ExpenseModel>> call();
}
