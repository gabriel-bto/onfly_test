import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/get_expense_from_id_repository.dart';
import '../datasources/get_expense_from_id_datasource.dart';

class GetExpenseFromIdRepositoryImplementation
    implements GetExpenseFromIdRepository {
  final GetExpenseFromIdDatasource _getExpenseFromIdDatasource;

  GetExpenseFromIdRepositoryImplementation(this._getExpenseFromIdDatasource);

  @override
  Future<ExpenseEntity> call(String id) async {
    try {
      return await _getExpenseFromIdDatasource(id);
    } on Exception {
      throw Exception('Não foi possível busca a despesa');
    }
  }
}