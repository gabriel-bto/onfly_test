import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../remove_expense_from_id_datasource.dart';

class RemoveExpenseRemoteDatasourceImplementation
    implements RemoveExpenseFromIdDatasource {
  final HttpClientImplementation _httpClientImplementation;

  RemoveExpenseRemoteDatasourceImplementation(this._httpClientImplementation);

  @override
  Future<bool> call(String id) async {
    await _httpClientImplementation.get(ApiUtils.getRouteRemoveExpense(id));

    return true;
  }
}
