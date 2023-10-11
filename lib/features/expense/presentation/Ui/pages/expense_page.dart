import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:onfly_test/core/ui/theme_extension.dart';
import 'package:onfly_test/features/expense/presentation/Ui/components/expansible_card.dart';

import '../../controllers/expense_controller.dart';
import '../widgets/add_expense_button.dart';
import '../components/total_expense_card.dart';
import 'add_edit_expense_page.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final controller = GetIt.I.get<ExpenseController>();

  @override
  void initState() {
    controller.getAllExpensesUsecase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        floatingActionButton: AddExpenseButton(
          label: 'Nova Despesa',
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddEditExpensePage();
                },
              ),
            );
            await controller.getAllExpensesUsecase();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TotalExpenseCard(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.expanses,
                builder: (_, expanses, __) {
                  return ListView.builder(
                    itemCount: expanses.length,
                    itemBuilder: (context, index) {
                      return ExpansibleCard(expense: expanses[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
