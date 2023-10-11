import 'package:flutter/material.dart';
import 'package:onfly_test/features/expense/data/datasources/sync_decorator/sync_expense_datasource_implementation.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

import '../../domain/entities/expense_entity.dart';
import '../../domain/usecases/create_expense/create_expense_usecase.dart';
import '../../domain/usecases/get_all_expenses/get_all_expenses_usecase.dart';
import '../../domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import '../../domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase.dart';
import '../../domain/usecases/update_expense/update_expense_usecase.dart';

class ExpenseController {
  final CreateExpenseUsecase _createExpenseUsecase;
  final GetAllExpensesUsecase _getAllExpensesUsecase;
  final GetExpenseFromIdUsecase _getExpenseFromIdUsecase;
  final RemoveExpenseFromIdUsecase _removeExpenseFromIdUsecase;
  final UpdateExpenseUsecase _updateExpenseUsecase;
  final SyncExpenseDatasourceImplementation _syncExpenseDatasourceImplementation;

  ExpenseController({
    required CreateExpenseUsecase createExpenseUsecase,
    required GetAllExpensesUsecase getAllExpensesUsecase,
    required GetExpenseFromIdUsecase getExpenseFromIdUsecase,
    required RemoveExpenseFromIdUsecase removeExpenseFromIdUsecase,
    required UpdateExpenseUsecase updateExpenseUsecase,
    required SyncExpenseDatasourceImplementation syncExpenseDatasourceImplementation
  })  : _createExpenseUsecase = createExpenseUsecase,
        _getAllExpensesUsecase = getAllExpensesUsecase,
        _getExpenseFromIdUsecase = getExpenseFromIdUsecase,
        _removeExpenseFromIdUsecase = removeExpenseFromIdUsecase,
        _updateExpenseUsecase = updateExpenseUsecase,
        _syncExpenseDatasourceImplementation = syncExpenseDatasourceImplementation;

  ValueNotifier<List<ExpenseModel>> expanses = ValueNotifier([]);
  double totalExpanses = 0.0;

  String get stringTotalExpense =>
      'R\$ ${totalExpanses.toStringAsFixed(2)}'.replaceAll('.', ',');

  Future<bool> createExpenseUsecase(ExpenseEntity expenseEntity) async {
    return _createExpenseUsecase(expenseEntity);
  }

  Future<void> getAllExpensesUsecase() async {
    expanses.value = await _getAllExpensesUsecase();
    totalExpanses = 0.0;
    totalExpanses = expanses.value.fold<double>(
      totalExpanses,
      (previousValue, expense) => previousValue + expense.amount,
    );
  }

  Future<ExpenseEntity> getExpenseFromIdUsecase(String id) async {
    return _getExpenseFromIdUsecase(id);
  }

  Future<bool> removeExpenseFromIdUsecase(String id) async {
    return _removeExpenseFromIdUsecase(id);
  }

  Future<bool> updateExpenseUsecase(ExpenseEntity expenseEntity) async {
    return _updateExpenseUsecase(expenseEntity);
  }
}
