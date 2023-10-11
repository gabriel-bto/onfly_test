import 'dart:convert';
import 'dart:io';

import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../domain/entities/expense_entity.dart';
import '../../models/expense_model.dart';
import '../get_all_expenses_datasource.dart';

class GetAllExpensesRemoteDatasourceImplementation
    implements GetAllExpensesDatasource {
  final HttpClientImplementation _httpClientImplementation;
  GetAllExpensesRemoteDatasourceImplementation(this._httpClientImplementation);

  @override
  Future<List<ExpenseEntity>> call() async {
    var result = await _httpClientImplementation.get(
      ApiUtils.routeListExpenses,
    );

    if (result.statusCode != 200) {
      throw const HttpException('an error ocourred');
    }

    var json = jsonDecode(result.data);
    var jsonList = json['items'] as List;
    return jsonList.map((json) => ExpenseModel.fromJson(json)).toList();
  }
}
