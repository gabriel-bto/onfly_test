import '../../../presentation/Ui/models/expense_model.dart';
import '../../repositories/get_expense_from_id_repository.dart';
import 'get_expense_from_id_usecase.dart';

class GetExpenseFromIdUsecaseImplementation implements GetExpenseFromIdUsecase {
  final GetExpenseFromIdRepository _getExpenseFromIdRepository;

  GetExpenseFromIdUsecaseImplementation(this._getExpenseFromIdRepository);

  @override
  Future<ExpenseModel> call(String id) async {
    return await _getExpenseFromIdRepository(id);
  }
}
