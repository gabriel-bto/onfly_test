abstract class ApiUtils {
  static const String baseURL = 'https://go-bd-api-3iyuzyysfa-uc.a.run.app/api';

  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE2OTgxOTAzOTEsImlkIjoiZWhnMDJhaGxmaGR0emdtIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.fnV7xfE2iX8MKVLqe79e7isR8TAVwAO86z12d3eo1XU';

  static const String login = 'nrRUdBbW';

  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
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
