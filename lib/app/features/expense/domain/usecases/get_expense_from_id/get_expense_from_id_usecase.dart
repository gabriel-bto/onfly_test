import '../../entities/expense_entity.dart';

abstract class GetExpenseFromIdUsecase {
  Future<ExpenseEntity> call(String id);
}
