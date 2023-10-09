import '../../../../../../core/database/sqlite_connection_factory.dart';
import '../../../../domain/entities/expense_entity.dart';
import 'create_expense_local_decorator.dart';

class CreateExpenseLocalDecoratorImplementation
    extends CreateExpenseLocalDecorator {
  CreateExpenseLocalDecoratorImplementation(super.getAllExpensesDatasource);

  final _sqliteConnectionFactory = SqliteConnectionFactory();

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    try {
      await super(expenseEntity);
      await _createInLocal(expenseEntity);
      return true;
    } catch (_) {
      return _createInLocal(expenseEntity);
    }
  }

  Future<bool> _createInLocal(ExpenseEntity expenseEntity) async {
    final connection = await _sqliteConnectionFactory.openConnection();

    await connection.rawInsert('''
          insert into expense(id, descricao, expenseDate, amount, latitude, longitude) 
          values(?, ?, ?, ?, ?, ?)
        ''', [
      expenseEntity.id,
      expenseEntity.description,
      expenseEntity.expenseDate,
      expenseEntity.amount,
      expenseEntity.latitude,
      expenseEntity.longitude,
    ]);

    return true;
  }
}
