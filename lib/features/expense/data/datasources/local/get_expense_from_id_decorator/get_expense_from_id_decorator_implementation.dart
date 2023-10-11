import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../domain/entities/expense_entity.dart';
import '../../../models/expense_model.dart';
import 'get_expense_from_id_decorator.dart';

class GetExpenseFromIdDecoratorImplementation
    extends GetExpenseFromIdDecorator {
  GetExpenseFromIdDecoratorImplementation(super.getExpenseFromIdDatasource);

  late Database db;

  @override
  Future<ExpenseEntity> call(String id) async {
    try {
      return await super(id);
    } catch (_) {
      return await _getInLocal(id);
    }
  }

  Future<ExpenseEntity> _getInLocal(String id) async {
    db = await DB.istance.database;

    final response = await db.query(
      'expense',
      where: 'id = ?',
      whereArgs: [id],
    );

    return ExpenseModel.fromJson(response.first);
  }
}
