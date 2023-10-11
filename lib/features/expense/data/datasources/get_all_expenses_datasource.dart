import '../../presentation/Ui/models/expense_model.dart';

abstract class GetAllExpensesDatasource {
  Future<List<ExpenseModel>> call();
}
