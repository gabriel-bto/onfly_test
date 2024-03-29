import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/domain/repositories/get_all_expenses_repository.dart';
import 'package:onfly_test/features/expense/domain/usecases/get_all_expenses/get_all_expenses_usecase.dart';
import 'package:onfly_test/features/expense/domain/usecases/get_all_expenses/get_all_expenses_usecase_implementation.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesRepository {
  @override
  Future<List<ExpenseModel>> call() async {
    return [
      ExpenseModel(
        id: 'zdf12',
        description: 'Despesa 123',
        expenseDate: DateTime.now(),
        amount: 12.50,
        latitude: '80.121212',
        longitude: '40.232323',
      ),
    ];
  }
}

void main() {
  late GetAllExpensesUsecase useCase;

  setUp(() {
    useCase = GetAllExpensesUsecaseImplementation(
      GetAllExpensesRepositoryImplementation(),
    );
  });

  test('should return all expenses', () async {
    final result = await useCase();

    expect(result, isA<List<ExpenseEntity>>());
    expect(result, isNotNull);
  });
}
