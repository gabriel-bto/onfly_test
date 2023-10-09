import '../../../../domain/entities/expense_entity.dart';
import '../../get_expense_from_id_datasource.dart';

class GetExpenseFromIdDecorator implements GetExpenseFromIdDatasource {
  final GetExpenseFromIdDatasource _getExpenseFromIdDatasource;
  GetExpenseFromIdDecorator(this._getExpenseFromIdDatasource);

  @override
  Future<ExpenseEntity> call(int id) async => _getExpenseFromIdDatasource(id);
}
