abstract class ApiUtils {
  static const String baseURL = 'https://go-bd-api-3iyuzyysfa-uc.a.run.app/api';

  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE2OTgyMjc5MzcsImlkIjoiODJqbzZrNDJpbXIwMnFtIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.LoQffT2K14LFEKUZ6kgCDKPKWw4gcivIw_t7oil455M';

  static const String login = 'ccObDnaf';

  static Map<String, String> get headers => {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': token,
      };

  static const String routeListExpenses =
      '$baseURL/collections/expense_$login/records';

  static String getRouteGetExpense(String id) =>
      '$baseURL/collections/expense_$login/records/$id';

  static const String routeCreateExpense =
      '$baseURL/collections/expense_$login/records';

  static String getRouteUpdateExpense(String id) =>
      '$baseURL/collections/expense_$login/records/$id';

  static String getRouteRemoveExpense(String id) =>
      '$baseURL/collections/expense_$login/records/$id';
}
