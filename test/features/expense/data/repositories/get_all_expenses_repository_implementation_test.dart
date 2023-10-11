import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/get_all_expenses_datasource.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesDatasource {
  @override
  Future<List<ExpenseEntity>> call() async {
    throw Exception('not found');
  }
}

void main() {
  late GetAllExpensesRepositoryImplementation implementation;

  setUp(() {
    implementation = GetAllExpensesRepositoryImplementation();
  });

  test('should throw an Exception, case list not found', () {
    expect(() async => await implementation(), throwsException);
  });
}
