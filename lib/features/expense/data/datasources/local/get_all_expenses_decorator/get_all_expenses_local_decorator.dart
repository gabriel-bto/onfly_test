import '../../../../domain/entities/expense_entity.dart';
import '../../get_all_expenses_datasource.dart';

class GetAllExpensesLocalDecorator implements GetAllExpensesDatasource {
  final GetAllExpensesDatasource _getAllExpensesDatasource;
  GetAllExpensesLocalDecorator(this._getAllExpensesDatasource);

  @override
  Future<List<ExpenseEntity>> call() async => await _getAllExpensesDatasource();
}
