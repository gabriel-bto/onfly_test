import '../../../../presentation/Ui/models/expense_model.dart';
import '../../get_all_expenses_datasource.dart';

class GetAllExpensesLocalDecorator implements GetAllExpensesDatasource {
  final GetAllExpensesDatasource _getAllExpensesDatasource;
  GetAllExpensesLocalDecorator(this._getAllExpensesDatasource);

  @override
  Future<List<ExpenseModel>> call() async => await _getAllExpensesDatasource();
}
