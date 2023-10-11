import '../../domain/repositories/get_all_expenses_repository.dart';
import '../../presentation/Ui/models/expense_model.dart';
import '../datasources/get_all_expenses_datasource.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesRepository {
  final GetAllExpensesDatasource _getAllExpensesDatasource;

  GetAllExpensesRepositoryImplementation(this._getAllExpensesDatasource);

  @override
  Future<List<ExpenseModel>> call() async {
    try {
      return await _getAllExpensesDatasource();
    } on Exception {
      throw Exception('Não foi possível buscar despesas');
    }
  }
}
