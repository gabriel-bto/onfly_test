abstract class ApiUtils {
  static const String baseURL = "https://go-bd-api-3iyuzyysfa-uc.a.run.app/api";

  static const String token = ""; // returned from Authentication method

  static const String login = "ccObDnaf"; // login provided

  static const String routeListExpenses = "/collections/expense_$login/records";

  static const String routeGetExpense = "/collections/expense_$login/records/";

  static const String routeCreateExpense =
      "/collections/expense_$login/records";

  static const String routeUpdateExpense =
      "/collections/expense_$login/records/";

  static const String routeRemoveExpense =
      "/collections/expense_$login/records/";
}
