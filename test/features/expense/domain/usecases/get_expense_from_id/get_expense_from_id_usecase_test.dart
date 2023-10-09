import 'package:onfly_test/app/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/app/features/expense/domain/repositories/get_expense_from_id_repository.dart';
import 'package:onfly_test/app/features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import 'package:onfly_test/app/features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase_implementation.dart';
import 'package:flutter_test/flutter_test.dart';

class GetExpenseFromIdRepositoryImplementation
    implements GetExpenseFromIdRepository {
  final List<ExpenseEntity> expenses = [
    ExpenseEntity(
      id: 'zdf2',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    ),
  ];

  @override
  Future<ExpenseEntity> call(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('Id não pode ser um valor vazio');
    }

    return expenses.singleWhere(
      (expanse) => expanse.id == id,
      orElse: () => throw Exception('Despesa não encontrada'),
    );
  }
}

void main() {
  test('should throw ArgumentError', () {
    GetExpenseFromIdUsecase useCase = GetExpenseFromIdUsecaseImplementation(
      GetExpenseFromIdRepositoryImplementation(),
    );

    expect(() async => await useCase(''), throwsA(isA<ArgumentError>()));
  });

  test('should throw Exception', () {
    GetExpenseFromIdUsecase useCase = GetExpenseFromIdUsecaseImplementation(
      GetExpenseFromIdRepositoryImplementation(),
    );

    expect(() async => await useCase('404'), throwsA(isA<Exception>()));
  });

  test('should get expense entity for a given id', () async {
    GetExpenseFromIdUsecase useCase = GetExpenseFromIdUsecaseImplementation(
      GetExpenseFromIdRepositoryImplementation(),
    );

    final result = await useCase('zdf2');

    expect(result, isA<ExpenseEntity>());
  });
}
