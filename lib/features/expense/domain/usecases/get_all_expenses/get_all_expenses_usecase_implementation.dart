import '../../entities/expense_entity.dart';
import '../../repositories/get_all_expenses_repository.dart';
import 'get_all_expenses_usecase.dart';

class GetAllExpensesUsecaseImplementation implements GetAllExpensesUsecase {
  final GetAllExpensesRepository _getAllExpensesRepository;

  GetAllExpensesUsecaseImplementation(this._getAllExpensesRepository);

  @override
  Future<List<ExpenseEntity>> call() async {
    return await _getAllExpensesRepository();
  }
}
