import 'package:sqflite/sqflite.dart';

import '../../../../../../core/database/database.dart';
import 'remove_expense_from_id_decorator.dart';

class RemoveExpenseFromIdDecoratorImplementation
    extends RemoveExpenseFromIdDecorator {
  RemoveExpenseFromIdDecoratorImplementation(
      super.removeExpenseFromIdDatasource);

  late Database db;

  @override
  Future<bool> call(String id) async {
    try {
      await super(id);
      await _removeInLocal(id);
      return true;
    } catch (_) {
      await _removeInLocalCache(id);
      return true;
    }
  }

  Future<bool> _removeInLocal(String id) async {
    db = await DB.istance.database;

    await db.delete(
      'expense',
      where: 'id = ?',
      whereArgs: [id],
    );

    return true;
  }

  Future<bool> _removeInLocalCache(String id) async {
    db = await DB.istance.database;

    await db.rawUpdate(
      'UPDATE expense SET isRemove = 1 WHERE idLocal = ?',
      [id],
    );

    return true;
  }
}
