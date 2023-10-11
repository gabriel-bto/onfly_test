import '../../../presentation/Ui/models/expense_model.dart';
import '../../repositories/get_all_expenses_repository.dart';
import 'get_all_expenses_usecase.dart';

class GetAllExpensesUsecaseImplementation implements GetAllExpensesUsecase {
  final GetAllExpensesRepository _getAllExpensesRepository;

  GetAllExpensesUsecaseImplementation(this._getAllExpensesRepository);

  @override
  Future<List<ExpenseModel>> call() async {
    return await _getAllExpensesRepository();
  }
}
