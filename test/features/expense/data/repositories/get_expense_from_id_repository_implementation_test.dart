import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/Get_expense_from_id_datasource.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/presentation/Ui/models/expense_model.dart';

class GetExpenseFromIdRepositoryImplementation
    implements GetExpenseFromIdDatasource {
  @override
  Future<ExpenseModel> call(String id) async {
    if (id.isEmpty) {
      throw Exception('Message Test');
    }

    return ExpenseModel(
      amount: 10,
      description: 'a description',
      expenseDate: DateTime.now(),
      id: 'Thsis',
      latitude: '1030.1',
      longitude: '1551.2',
    );
  }
}

void main() {
  late GetExpenseFromIdRepositoryImplementation implementation;

  setUp(() {
    implementation = GetExpenseFromIdRepositoryImplementation();
  });

  test('should throw an Exception, case id is empty', () {
    expect(() async => await implementation(''), throwsException);
  });

  test('should return an Expense Entity and not throw Exception', () async {
    final result = await implementation('asdwvc');
    expect(result, isA<ExpenseEntity>());
  });
}
