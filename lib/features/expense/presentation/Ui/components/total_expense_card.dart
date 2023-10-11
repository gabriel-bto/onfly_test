import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/expense_controller.dart';
import '../../../../../core/ui/theme_extension.dart';

class TotalExpenseCard extends StatelessWidget {
  const TotalExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ExpenseController>();

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 130,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  controller.stringTotalExpense,
                  style: TextStyle(
                    color: context.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Total de Gastos',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
