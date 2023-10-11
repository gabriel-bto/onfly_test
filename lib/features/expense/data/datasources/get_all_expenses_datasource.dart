import '../../domain/entities/expense_entity.dart';

abstract class GetAllExpensesDatasource {
  Future<List<ExpenseEntity>> call();
}
