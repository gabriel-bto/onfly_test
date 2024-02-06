import 'package:flutter/material.dart';
import 'package:onfly_test/features/expense/data/datasources/sync_decorator/sync_expense_datasource_implementation.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

import '../../domain/entities/expense_entity.dart';
import '../../domain/usecases/create_expense/create_expense_usecase.dart';
import '../../domain/usecases/get_all_expenses/get_all_expenses_usecase.dart';
import '../../domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import '../../domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase.dart';
import '../../domain/usecases/update_expense/update_expense_usecase.dart';

class ExpenseController extends ChangeNotifier {
  final CreateExpenseUsecase _createExpenseUsecase;
  final GetAllExpensesUsecase _getAllExpensesUsecase;
  final GetExpenseFromIdUsecase _getExpenseFromIdUsecase;
  final RemoveExpenseFromIdUsecase _removeExpenseFromIdUsecase;
  final UpdateExpenseUsecase _updateExpenseUsecase;

  ExpenseController({
    required CreateExpenseUsecase createExpenseUsecase,
    required GetAllExpensesUsecase getAllExpensesUsecase,
    required GetExpenseFromIdUsecase getExpenseFromIdUsecase,
    required RemoveExpenseFromIdUsecase removeExpenseFromIdUsecase,
    required UpdateExpenseUsecase updateExpenseUsecase,
    required SyncExpenseDatasourceImplementation
        syncExpenseDatasourceImplementation,
  })  : _createExpenseUsecase = createExpenseUsecase,
        _getAllExpensesUsecase = getAllExpensesUsecase,
        _getExpenseFromIdUsecase = getExpenseFromIdUsecase,
        _removeExpenseFromIdUsecase = removeExpenseFromIdUsecase,
        _updateExpenseUsecase = updateExpenseUsecase;

  ValueNotifier<List<ExpenseModel>> expenses = ValueNotifier([]);
  ValueNotifier<String> totalExpenses = ValueNotifier('');

  Future<ExpenseEntity> createExpenseUsecase(
      ExpenseEntity expenseEntity) async {
    return await _createExpenseUsecase(expenseEntity);
  }

  Future<void> getAllExpensesUsecase() async {
    var expenseList = await _getAllExpensesUsecase();

    double total = 0;

    if (expenseList.isNotEmpty) {
      total =
          expenseList.map((expense) => expense.amount).reduce((a, b) => a + b);
    }

    expenses.value = expenseList;
    totalExpenses.value = total.toString();
  }

  Future<ExpenseEntity> getExpenseFromIdUsecase(String id) async {
    final expense = await _getExpenseFromIdUsecase(id);

    return expense;
  }

  Future<bool> removeExpenseFromIdUsecase(String id) async {
    final isRemoved = await _removeExpenseFromIdUsecase(id);

    return isRemoved;
  }

  Future<ExpenseEntity> updateExpenseUsecase(
      ExpenseEntity expenseEntity) async {
    return await _updateExpenseUsecase(expenseEntity);
  }
}
