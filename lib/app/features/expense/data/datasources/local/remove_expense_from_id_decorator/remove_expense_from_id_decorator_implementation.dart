import '../../../../../../core/database/sqlite_connection_factory.dart';
import 'remove_expense_from_id_decorator.dart';

class RemoveExpenseFromIdDecoratorImplementation
    extends RemoveExpenseFromIdDecorator {
  RemoveExpenseFromIdDecoratorImplementation(
      super.removeExpenseFromIdDatasource);

  final _sqliteConnectionFactory = SqliteConnectionFactory();

  @override
  Future<bool> call(String id) async {
    try {
      await super(id);
      await _removeInLocal(id);
      return true;
    } catch (_) {
      await _removeInLocal(id);
      return true;
    }
  }

  Future<bool> _removeInLocal(String id) async {
    final connection = await _sqliteConnectionFactory.openConnection();

    await connection.rawDelete('delete from expense where id = ?', [id]);

    return true;
  }
}
