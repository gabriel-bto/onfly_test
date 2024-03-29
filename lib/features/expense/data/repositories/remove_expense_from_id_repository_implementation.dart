import '../../domain/repositories/remove_expense_from_id_repository.dart';
import '../datasources/remove_expense_from_id_datasource.dart';

class RemoveExpenseFromIdRepositoryImplementation
    implements RemoveExpenseFromIdRepository {
  final RemoveExpenseFromIdDatasource _removeExpenseDatasource;

  RemoveExpenseFromIdRepositoryImplementation(this._removeExpenseDatasource);

  @override
  Future<bool> call(String id) async {
    try {
      return await _removeExpenseDatasource(id);
    } on Exception {
      throw Exception('Não foi possível remover a despesa');
    }
  }
}
