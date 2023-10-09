import 'package:onfly_test/app/features/expense/data/models/expense_model.dart';

import '../../../../../../core/database/sqlite_connection_factory.dart';
import '../../../../domain/entities/expense_entity.dart';
import '../../get_expense_from_id_datasource.dart';
import 'get_expense_from_id_decorator.dart';

class GetExpenseFromIdDecoratorImplementation
    extends GetExpenseFromIdDecorator {
  GetExpenseFromIdDecoratorImplementation(
      GetExpenseFromIdDatasource getExpenseFromIdDatasource)
      : super(getExpenseFromIdDatasource);

  final _sqliteConnectionFactory = SqliteConnectionFactory();

  @override
  Future<ExpenseEntity> call(String id) async {
    try {
      return await super(id);
    } catch (_) {
      return await _getInLocal(id);
    }
  }

  Future<ExpenseEntity> _getInLocal(String id) async {
    final connection = await _sqliteConnectionFactory.openConnection();

    final response = await connection.rawQuery('''
      get * from expense where id = ?
    ''', [id]);

    return ExpenseModel.fromJson(response.first);
  }
}
