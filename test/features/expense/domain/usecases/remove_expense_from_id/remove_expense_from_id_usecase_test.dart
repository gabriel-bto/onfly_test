import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/remove_expense_from_id_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/remove_expense_from_id/remove_expense_from_id_usecase_implementation.dart';

class RemoveExpenseFromIdRepositoryImplementation
    implements RemoveExpenseFromIdRepository {
  final List<ExpenseEntity> expenses = [
    ExpenseEntity(
      id: 'zrfs2etc',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    ),
  ];

  @override
  Future<bool> call(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('Id can\'t be empty');
    }

    expenses.singleWhere(
      (expanse) => expanse.id == id,
      orElse: () => throw Exception('expense not found'),
    );

    return true;
  }
}

void main() {
  test('should throw ArgumentError', () {
    RemoveExpenseFromIdUsecase useCase =
        RemoveExpenseFromIdUsecaseImplementation(
      RemoveExpenseFromIdRepositoryImplementation(),
    );

    expect(() async => await useCase(''), throwsA(isA<ArgumentError>()));
  });

  test('should throw Exception', () {
    RemoveExpenseFromIdUsecase useCase =
        RemoveExpenseFromIdUsecaseImplementation(
      RemoveExpenseFromIdRepositoryImplementation(),
    );

    expect(() async => await useCase('404'), throwsA(isA<Exception>()));
  });

  test('should delete expense entity for a given id', () async {
    RemoveExpenseFromIdUsecase useCase =
        RemoveExpenseFromIdUsecaseImplementation(
      RemoveExpenseFromIdRepositoryImplementation(),
    );

    final result = await useCase('zrfs2etc');

    expect(result, true);
  });
}
