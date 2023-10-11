import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  final bool isCreate;
  final bool isUpdate;
  final bool isRemove;

  ExpenseModel({
    this.isCreate = false,
    this.isUpdate = false,
    this.isRemove = false,
    super.id,
    required super.description,
    required super.expenseDate,
    required super.amount,
    required super.latitude,
    required super.longitude,
  });
}
