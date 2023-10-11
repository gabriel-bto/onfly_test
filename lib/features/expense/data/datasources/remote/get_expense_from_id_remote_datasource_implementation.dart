import 'dart:convert';
import 'dart:io';

import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../domain/entities/expense_entity.dart';
import '../../models/expense_model.dart';
import '../get_expense_from_id_datasource.dart';

class GetExpenseFromIdRemoteDatasourceImplementation
    implements GetExpenseFromIdDatasource {
  final HttpClientImplementation _httpClientImplementation;

  GetExpenseFromIdRemoteDatasourceImplementation(
    this._httpClientImplementation,
  );

  @override
  Future<ExpenseEntity> call(String id) async {
    var result = await _httpClientImplementation.get(
      ApiUtils.getRouteGetExpense(id),
    );

    if (result.statusCode != 200) {
      throw const HttpException('an error ocourred');
    }

    var json = jsonDecode(result.data);

    return ExpenseModel.fromJson(json['items']);
  }
}