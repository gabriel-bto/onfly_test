import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/create_expense_datasource.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';

class CreateExpenseRepositoryImplementation implements CreateExpenseDatasource {
  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    if (expenseEntity.id == null) throw Exception('not found');

    return expenseEntity;
  }

  void main() {
    late CreateExpenseRepositoryImplementation implementation;
    late ExpenseEntity expenseEntity;
    late ExpenseEntity failureExpenseEntity;

    setUp(() {
      implementation = CreateExpenseRepositoryImplementation();
      expenseEntity = ExpenseEntity(
        id: 'agsv',
        description: 'a description test',
        expenseDate: DateTime.now(),
        amount: 15.50,
        latitude: '10.20',
        longitude: '30.20',
      );

      failureExpenseEntity = ExpenseEntity(
        id: '',
        description: 'a description test',
        expenseDate: DateTime.now(),
        amount: 15.50,
        latitude: '10.20',
        longitude: '30.20',
      );
    });

    test('should throw an Exception, case id is incorrect', () {
      expect(
        () async => await implementation(failureExpenseEntity),
        throwsException,
      );
    });

    test('should return true, case Expense Entity is correct', () {
      expect(
        () async => await implementation(expenseEntity),
        throwsException,
      );
    });
  }
}
