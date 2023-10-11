import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/create_expense_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/create_expense/create_expense_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/create_expense/create_expense_usecase_implementation.dart';

class CreateExpenseRepositoryImplementation implements CreateExpenseRepository {
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    return true;
  }
}

void main() {
  test('should create an expense', () async {
    var newExpense = ExpenseEntity(
      id: 'zdf12',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    CreateExpenseUsecase useCase = CreateExpenseUsecaseImplementation(
      CreateExpenseRepositoryImplementation(),
    );

    var result = await useCase(newExpense);

    expect(result, true);
  });
}
