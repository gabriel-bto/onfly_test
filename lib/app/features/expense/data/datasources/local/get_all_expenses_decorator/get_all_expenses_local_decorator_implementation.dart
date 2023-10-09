import 'dart:async';
import 'dart:convert';

import '../../../../../../core/database/sqlite_connection_factory.dart';
import '../../../../domain/entities/expense_entity.dart';
import '../../../models/expense_model.dart';
import '../../get_all_expenses_datasource.dart';
import 'get_all_expenses_local_decorator.dart';

class GetAllExpensesLocalDecoratorImplementation
    extends GetAllExpensesLocalDecorator {
  GetAllExpensesLocalDecoratorImplementation(
    GetAllExpensesDatasource getAllExpensesDatasource,
  ) : super(getAllExpensesDatasource);

  final _sqliteConnectionFactory = SqliteConnectionFactory();

  @override
  Future<List<ExpenseEntity>> call() async {
    try {
      final result = await super();
      _saveInLocal(result);
      return result;
    } catch (_) {
      return _getInLocal();
    }
  }

  Future<List<ExpenseEntity>> _getInLocal() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery('''
      select * 
      from expense 
    ''');
    var jsonList = jsonEncode(result) as List;
    return jsonList.map((json) => ExpenseModel.fromJson(json)).toList();
  }

  Future<void> _saveInLocal(List<ExpenseEntity> expenseEntityList) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    expenseEntityList.map(
      (expensive) async {
        await conn.rawInsert('''
          insert into expense(id, descricao, expenseDate, amount, latitude, longitude) 
          values(?, ?, ?, ?, ?, ?)
        ''', [
          expensive.id,
          expensive.description,
          expensive.expenseDate,
          expensive.amount,
          expensive.latitude,
          expensive.longitude,
        ]);
      },
    );
  }
}
