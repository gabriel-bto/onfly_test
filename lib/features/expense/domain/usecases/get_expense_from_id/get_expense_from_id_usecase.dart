import '../../../presentation/Ui/models/expense_model.dart';

abstract class GetExpenseFromIdUsecase {
  Future<ExpenseModel> call(String id);
}
