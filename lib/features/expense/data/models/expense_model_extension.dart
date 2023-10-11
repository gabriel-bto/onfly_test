import 'package:flutter/material.dart';

import '../../domain/entities/expense_entity.dart';

extension ExpenseModelExtension on ExpenseEntity {
  static ExpenseEntity fromJson(Map<String, Object?> json) {
    return ExpenseEntity(
      id: json['id'] as String?,
      description: json['description'] as String? ?? '',
      expenseDate: DateTime.tryParse(json['expense_date'] as String? ?? '') ??
          DateTime.now(),
      amount: json['amount'] as double? ?? 0,
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'expense_date': expenseDate.toUtc().toString(),
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
