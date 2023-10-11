import '../../presentation/Ui/models/expense_model.dart';

abstract class GetExpenseFromIdDatasource {
  Future<ExpenseModel> call(String id);
}
