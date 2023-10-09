import '../../entities/expense_entity.dart';
import '../../repositories/get_expense_from_id_repository.dart';
import 'get_expense_from_id_usecase.dart';

class GetExpenseFromIdUsecaseImplementation implements GetExpenseFromIdUsecase {
  final GetExpenseFromIdRepository _getExpenseFromIdRepository;

  GetExpenseFromIdUsecaseImplementation(this._getExpenseFromIdRepository);

  @override
  Future<ExpenseEntity> call(int id) async {
    return await _getExpenseFromIdRepository(id);
  }
}
