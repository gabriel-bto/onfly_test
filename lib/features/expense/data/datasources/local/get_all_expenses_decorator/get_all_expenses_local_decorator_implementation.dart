import 'dart:async';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import '../../../models/expense_model.dart';
import 'get_all_expenses_local_decorator.dart';

class GetAllExpensesLocalDecoratorImplementation
    extends GetAllExpensesLocalDecorator {
  GetAllExpensesLocalDecoratorImplementation(super.getAllExpensesDatasource);

  late Database db;

  @override
  Future<List<ExpenseEntity>> call() async {
    try {
      return await super();
    } catch (_) {
      return _getInLocal();
    }
  }

  Future<List<ExpenseEntity>> _getInLocal() async {
    db = await DB.istance.database;
    final result = await db.query('expense');
    var jsonList = jsonEncode(result) as List;
    return jsonList.map((json) => ExpenseModel.fromJson(json)).toList();
  }
}
