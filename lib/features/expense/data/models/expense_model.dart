import '../../domain/entities/expense_entity.dart';

extension ExpenseModel on ExpenseEntity {
  static ExpenseEntity fromJson(Map json) {
    return ExpenseEntity(
      id: json['id'] as int,
      description: json['description'] as String,
      expenseDate: json['expenseDate'] as DateTime,
      amount: json['amount'] as double,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  Map toJson() {
    return {
      'description': description,
      'expenseDate': expenseDate,
      'amount': amount,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
