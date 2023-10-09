import '../../remove_expense_from_id_datasource.dart';

class RemoveExpenseFromIdDecorator implements RemoveExpenseFromIdDatasource {
  final RemoveExpenseFromIdDatasource _removeExpenseFromIdDatasource;

  RemoveExpenseFromIdDecorator(this._removeExpenseFromIdDatasource);

  @override
  Future<bool> call(String id) async => await _removeExpenseFromIdDatasource(id);
}
