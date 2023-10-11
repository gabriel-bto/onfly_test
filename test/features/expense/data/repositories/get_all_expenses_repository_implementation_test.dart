import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/get_all_expenses_datasource.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

class GetAllExpensesRepositoryImplementation
    implements GetAllExpensesDatasource {
  @override
  Future<List<ExpenseModel>> call() async {
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
