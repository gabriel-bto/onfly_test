import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/get_all_expenses_repository.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesRepository {
  @override
  Future<List<ExpenseEntity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
