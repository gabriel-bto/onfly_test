class ExpenseEntity {
  final String description;
  final DateTime expenseDate;
  final double amount;
  final String latitude;
  final String longitude;

  const ExpenseEntity({
    required this.description,
    required this.expenseDate,
    required this.amount,
    required this.latitude,
    required this.longitude,
  });
}
