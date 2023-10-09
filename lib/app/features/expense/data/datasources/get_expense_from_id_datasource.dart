import '../../domain/entities/expense_entity.dart';

abstract class GetExpenseFromIdDatasource {
  Future<ExpenseEntity> call(int id);
}
