import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/get_all_expenses_repository.dart';
import '../datasources/get_all_expenses_datasource.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesRepository {
  final GetAllExpensesDatasource _getAllExpensesDatasource;

  GetAllExpensesRepositoryImplementation(this._getAllExpensesDatasource);

  @override
  Future<List<ExpenseEntity>> call() async {
    try {
      return await _getAllExpensesDatasource();
    } on Exception {
      throw Exception('Não foi possível buscar despesas');
    }
  }
}
