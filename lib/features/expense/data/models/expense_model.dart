import '../../domain/entities/expense_entity.dart';

extension ExpenseModel on ExpenseEntity {
  static ExpenseEntity fromJson(Map json) {
    return ExpenseEntity(
      id: json['id'] as String,
      description: json['description'] as String,
      expenseDate: DateTime.parse(json['expense_date']),
      amount: json['amount'] as double,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'expense_date': expenseDate,
      'amount': amount,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
