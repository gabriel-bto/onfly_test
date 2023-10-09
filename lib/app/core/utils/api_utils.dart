abstract class ApiUtils {
  static const String baseURL = "https://go-bd-api-3iyuzyysfa-uc.a.run.app/api";

  static const String token = ""; // returned from Authentication method

  static const String login = "ccObDnaf"; // login provided

  static Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": token,
      };

  static const String routeListExpenses = "/collections/expense_$login/records";

  static String getRouteGetExpense(int id) => "/collections/expense_$login/records/$id";

  static const String routeCreateExpense =
      "/collections/expense_$login/records";

  static String getRouteUpdateExpense(int id) =>
      "/collections/expense_$login/records/$id";

  static String getRouteRemoveExpense(int id) =>
      "/collections/expense_$login/records/$id";
}
