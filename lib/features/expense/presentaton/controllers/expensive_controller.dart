import '../../domain/usecases/create_expense/create_expense_usecase.dart';
import '../../domain/usecases/get_all_expenses/get_all_expenses_usecase.dart';
import '../../domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import '../../domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase.dart';
import '../../domain/usecases/update_expense/update_expense_usecase.dart';

class ExpensiveController {
  final CreateExpenseUsecase _createExpenseUsecase;
  final GetAllExpensesUsecase _getAllExpensesUsecase;
  final GetExpenseFromIdUsecase _getExpenseFromIdUsecase;
  final RemoveExpenseFromIdUsecase _removeExpenseFromIdUsecase;
  final UpdateExpenseUsecase _updateExpenseUsecase;

  ExpensiveController({
    required CreateExpenseUsecase createExpenseUsecase,
    required GetAllExpensesUsecase getAllExpensesUsecase,
    required GetExpenseFromIdUsecase getExpenseFromIdUsecase,
    required RemoveExpenseFromIdUsecase removeExpenseFromIdUsecase,
    required UpdateExpenseUsecase updateExpenseUsecase,
  })  : _createExpenseUsecase = createExpenseUsecase,
        _getAllExpensesUsecase = getAllExpensesUsecase,
        _getExpenseFromIdUsecase = getExpenseFromIdUsecase,
        _removeExpenseFromIdUsecase = removeExpenseFromIdUsecase,
        _updateExpenseUsecase = updateExpenseUsecase;


}
