import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../remove_expense_from_id_datasource.dart';

class RemoveExpenseFromIdRemoteDatasourceImplementation
    implements RemoveExpenseFromIdDatasource {
  final HttpClientImplementation _httpClientImplementation;

  RemoveExpenseFromIdRemoteDatasourceImplementation(
      this._httpClientImplementation);

  @override
  Future<bool> call(String id) async {
    final result = await _httpClientImplementation.get(
      ApiUtils.getRouteRemoveExpense(id),
    );

    if (result.statusCode != 200) {
      throw Exception('ocourred an error');
    }

    return result.statusCode == 200;
  }
}
