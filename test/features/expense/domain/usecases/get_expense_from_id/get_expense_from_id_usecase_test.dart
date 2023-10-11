import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/get_expense_from_id_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/get_expense_from_id/get_expense_from_id_usecase_implementation.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

class GetExpenseFromIdRepositoryImplementation
    implements GetExpenseFromIdRepository {
  final List<ExpenseModel> expenses = [
    ExpenseModel(
      id: 'zdf2',
      description: 'Despesa 123',
      expenseDate: DateTime.now(),
      amount: 12.50,
      latitude: '80.121212',
      longitude: '40.232323',
    ),
  ];

  @override
  Future<ExpenseModel> call(String id) async {
    if (id.isEmpty) {
      throw ArgumentError('id can\t be empty');
    }

    return expenses.singleWhere(
      (expanse) => expanse.id == id,
      orElse: () => throw Exception('Expense not found'),
    );
  }
}

void main() {
  late GetExpenseFromIdUsecase useCase;

  setUp(() {
    useCase = GetExpenseFromIdUsecaseImplementation(
      GetExpenseFromIdRepositoryImplementation(),
    );
  });

  test('should get expense entity for a given id', () async {
    final result = await useCase('zdf2');

    expect(result, isA<ExpenseEntity>());
  });
}
