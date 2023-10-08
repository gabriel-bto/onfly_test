import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/update_expense_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase_implementation.dart';

class UpdateExpenseRepositoryImplementation implements UpdateExpenseRepository {
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    return true;
  }
}

void main() {
  test('should update an expense', () async {
    var newExpense = ExpenseEntity(
      id: 1,
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: "80.121212",
      longitude: "40.232323",
    );

    UpdateExpenseUsecase useCase = UpdateExpenseUsecaseImplementation(
      UpdateExpenseRepositoryImplementation(),
    );

    var result = await useCase(newExpense);

    expect(result, true);
  });
}