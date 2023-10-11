import 'dart:io';

import 'package:onfly_test/features/expense/data/models/expense_model.dart';

import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../domain/entities/expense_entity.dart';
import '../create_expense_datasource.dart';

class CreateExpenseRemoteDatasourceImplementation
    implements CreateExpenseDatasource {
  final HttpClientImplementation _httpClientImplementation;
  CreateExpenseRemoteDatasourceImplementation(this._httpClientImplementation);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    final result = await _httpClientImplementation.post(
      ApiUtils.routeCreateExpense,
      queryParameters: expenseEntity.toJson(),
    );

    if (result.statusCode != 200) {
      throw const HttpException('an error ocourred');
    }

    return result.statusCode == 200;
  }
}
