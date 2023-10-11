import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/update_expense_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase_implementation.dart';

class UpdateExpenseRepositoryImplementation implements UpdateExpenseRepository {
  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    if (expenseEntity.id.isEmpty) throw ArgumentError('Id can\'t be empty');
    return true;
  }
}

void main() {
  test('should update an expense', () async {
    var newExpense = ExpenseEntity(
      id: 'zrfs2etc',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    UpdateExpenseUsecase useCase = UpdateExpenseUsecaseImplementation(
      UpdateExpenseRepositoryImplementation(),
    );

    var result = await useCase(newExpense);

    expect(result, true);
  });

  test('should throw an Argument Erro case Id is empty', () {
    var newExpense = ExpenseEntity(
      id: '',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    UpdateExpenseUsecase useCase = UpdateExpenseUsecaseImplementation(
      UpdateExpenseRepositoryImplementation(),
    );

    expect(
      () async => await useCase(newExpense),
      throwsA(isA<ArgumentError>()),
    );
  });
}
