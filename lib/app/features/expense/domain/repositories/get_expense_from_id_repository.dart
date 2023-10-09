import '../entities/expense_entity.dart';

abstract class GetExpenseFromIdRepository {
  Future<ExpenseEntity> call(String id);
}