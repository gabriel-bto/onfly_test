import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import '../../../../presentation/Ui/models/expense_model.dart';
import '../../../models/expense_model_extension.dart';
import 'get_expense_from_id_decorator.dart';

class GetExpenseFromIdDecoratorImplementation
    extends GetExpenseFromIdDecorator {
  GetExpenseFromIdDecoratorImplementation(super.getExpenseFromIdDatasource);

  late Database db;

  @override
  Future<ExpenseModel> call(String id) async {
    try {
      return await super(id);
    } catch (_) {
      return await _getInLocal(id);
    }
  }

  Future<ExpenseModel> _getInLocal(String id) async {
    db = await DB.istance.database;

    final response = await db.query(
      'expense',
      where: 'idLocal = ?',
      whereArgs: [id],
    );

    final expense = ExpenseModelExtension.fromJson(response.first);
    return ExpenseModel(
      isCreate: response.first['isCreate'] as bool,
      isRemove: response.first['isRemove'] as bool,
      isUpdate: response.first['isUpdate'] as bool,
      description: expense.description,
      expenseDate: expense.expenseDate,
      amount: expense.amount,
      latitude: expense.latitude,
      longitude: expense.longitude,
    );
  }
}
