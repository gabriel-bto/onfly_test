import '../../entities/expense_entity.dart';

abstract class GetExpenseFromIdUsecase {
  ExpenseEntity call(int id);
}
