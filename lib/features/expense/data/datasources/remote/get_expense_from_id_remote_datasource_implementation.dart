import 'dart:convert';
import 'dart:io';

import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../presentation/Ui/models/expense_model.dart';
import '../../models/expense_model_extension.dart';
import '../get_expense_from_id_datasource.dart';

class GetExpenseFromIdRemoteDatasourceImplementation
    implements GetExpenseFromIdDatasource {
  final HttpClientImplementation _httpClientImplementation;

  GetExpenseFromIdRemoteDatasourceImplementation(
    this._httpClientImplementation,
  );

  @override
  Future<ExpenseModel> call(String id) async {
    var result = await _httpClientImplementation.get(
      ApiUtils.getRouteGetExpense(id),
    );

    if (result.statusCode != 200) {
      throw const HttpException('an error ocourred');
    }

    var json = jsonDecode(result.data);

    return json.map((json) {
      final expense = ExpenseModelExtension.fromJson(json);
      return ExpenseModel(
        description: expense.description,
        expenseDate: expense.expenseDate,
        amount: expense.amount,
        latitude: expense.latitude,
        longitude: expense.longitude,
      );
    });
  }
}
