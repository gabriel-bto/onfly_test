class ExpenseEntity {
  final String? id;
  final String description;
  final DateTime expenseDate;
  final double amount;
  final String latitude;
  final String longitude;

  ExpenseEntity({
    required this.description,
    required this.expenseDate,
    required this.amount,
    required this.latitude,
    required this.longitude,
    this.id,
  });
}
