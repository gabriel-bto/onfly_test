import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/app/features/expense/data/models/expense_model.dart';
import 'package:onfly_test/app/features/expense/domain/entities/expense_entity.dart';

void main() {
  test('should get a expense entity from given a json', () {
    final json = {
      'id': 'zdf12',
      'description': 'Despesa 123',
      'expense_date': '2023-09-01 10:00:00.123Z',
      'amount': 12.50,
      'latitude': '80.121212',
      'longitude': '40.232323'
    };

    expect(ExpenseModel.fromJson(json), isA<ExpenseEntity>());
  });

  test('should get a json from given a expense entity', () {
    final expenseTest = ExpenseEntity(
      id: 'zdf12',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    expect(expenseTest.toJson(), isA<Map>());
  });
}
