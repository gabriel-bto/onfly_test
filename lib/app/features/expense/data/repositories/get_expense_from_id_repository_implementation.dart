import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/get_expense_from_id_repository.dart';

class GetExpenseFromIdRepositoryImplementation
    implements GetExpenseFromIdRepository {
  @override
  Future<ExpenseEntity> call(int id) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
