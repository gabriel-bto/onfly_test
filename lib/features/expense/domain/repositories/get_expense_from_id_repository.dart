import '../../presentation/Ui/models/expense_model.dart';

abstract class GetExpenseFromIdRepository {
  Future<ExpenseModel> call(String id);
}
