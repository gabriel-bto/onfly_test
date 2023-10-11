import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/update_expense_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/update_expense/update_expense_usecase_implementation.dart';

class UpdateExpenseRepositoryImplementation implements UpdateExpenseRepository {
  @override
  Future<ExpenseEntity> call(ExpenseEntity expenseEntity) async {
    return expenseEntity;
  }
}

void main() {
  late ExpenseEntity expense;
  late UpdateExpenseUsecase useCase;

  setUp(() {
    expense = ExpenseEntity(
      id: 'zrfs2etc',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    );

    useCase = UpdateExpenseUsecaseImplementation(
      UpdateExpenseRepositoryImplementation(),
    );
  });

  test('should return true if update an expense', () async {
    var result = await useCase(expense);

    expect(result, true);
  });
}
