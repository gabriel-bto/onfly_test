import 'package:flutter_test/flutter_test.dart';
import 'package:onfly_test/features/expense/data/datasources/remove_expense_from_id_datasource.dart';

class RemoveExpenseFromIdRepositoryImplementation
    implements RemoveExpenseFromIdDatasource {
  @override
  Future<bool> call(String id) async {
    if (id.isEmpty) {
      throw Exception('Message Test');
    }

    return true;
  }
}

void main() {
  late RemoveExpenseFromIdRepositoryImplementation implementation;

  setUp(() {
    implementation = RemoveExpenseFromIdRepositoryImplementation();
  });

  test('should throw an Exception, case id is empty', () {
    expect(() async => await implementation(''), throwsException);
  });

  test('should return true and not throw Exception', () async {
    final result = await implementation('asdwvc');
    expect(result, true);
  });
}
