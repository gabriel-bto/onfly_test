import '../../../../presentation/Ui/models/expense_model.dart';
import '../../get_expense_from_id_datasource.dart';

class GetExpenseFromIdDecorator implements GetExpenseFromIdDatasource {
  final GetExpenseFromIdDatasource _getExpenseFromIdDatasource;
  GetExpenseFromIdDecorator(this._getExpenseFromIdDatasource);

  @override
  Future<ExpenseModel> call(String id) async => _getExpenseFromIdDatasource(id);
}
