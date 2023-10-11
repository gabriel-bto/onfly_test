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
  late ExpenseEntity expense;
  late CreateExpenseUsecase useCase;

  setUp(() {
    expense = ExpenseEntity(
      id: 'zdf12',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    useCase = CreateExpenseUsecaseImplementation(
      CreateExpenseRepositoryImplementation(),
    );
  });

  test('should create an expense', () async {
    var result = await useCase(expense);

    expect(result, true);
  });
}
