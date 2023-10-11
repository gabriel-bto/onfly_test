import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/update_expense_datasource.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';

class UpdateExpenseRepositoryImplementation implements UpdateExpenseDatasource {
  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    throw Exception('Message Test');
  }
}

void main() {
  late UpdateExpenseRepositoryImplementation implementation;
  late ExpenseEntity expense;

  setUp(() {
    implementation = UpdateExpenseRepositoryImplementation();
    expense = ExpenseEntity(
      id: 'agsv',
      description: 'a description test',
      expenseDate: DateTime.now(),
      amount: 15.50,
      latitude: '10.20',
      longitude: '30.20',
    );
  });

  test('should throw an Exception', () {
    expect(() async => await implementation(expense), throwsA(isA<Exception>()));
  });
}
