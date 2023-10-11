import '../../models/expense_model.dart';
import '../../../../../core/http_client/http_client_implementation.dart';
import '../../../../../core/utils/api_utils.dart';
import '../../../domain/entities/expense_entity.dart';
import '../update_expense_datasource.dart';

class UpdateExpenseRemoteDatasourceImplementation
    implements UpdateExpenseDatasource {
  final HttpClientImplementation _httpClientImplementation;

  UpdateExpenseRemoteDatasourceImplementation(this._httpClientImplementation);

  @override
  Future<bool> call(ExpenseEntity expenseEntity) async {
    await _httpClientImplementation.patch(
      ApiUtils.getRouteUpdateExpense(expenseEntity.id),
      queryParameters: expenseEntity.toJson(),
    );

    return true;
  }
}
