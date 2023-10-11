import 'package:flutter/material.dart';

import '../../domain/entities/expense_entity.dart';

extension ExpenseModelExtension on ExpenseEntity {
  static ExpenseEntity fromJson(Map json) {
    return ExpenseEntity(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      expenseDate: DateTime.tryParse(json['expense_date']) ?? DateTime.now(),
      amount: json['amount'] ?? 0,
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'expense_date': expenseDate.toIso8601String(),
      'amount': amount,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  ExpenseEntity copyWith(
      {ValueGetter<String?>? id,
      String? description,
      DateTime? expenseDate,
      double? amount,
      String? latitude,
      String? longitude}) {
    return ExpenseEntity(
        id: id != null ? id() : this.id,
        description: description ?? this.description,
        expenseDate: expenseDate ?? this.expenseDate,
        amount: amount ?? this.amount,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }
}
