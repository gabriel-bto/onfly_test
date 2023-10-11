import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:onfly_test/core/ui/theme_extension.dart';
import 'package:onfly_test/features/expense/data/models/expense_model_extension.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/add_expense_button.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/default_text_form_field.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/picture_container.dart';

import '../../controllers/expense_controller.dart';

class AddEditExpensePage extends StatefulWidget {
  final ExpenseEntity? expense;
  final ExpenseController controller;
  const AddEditExpensePage({super.key, this.expense, required this.controller});

  @override
  State<AddEditExpensePage> createState() => _AddEditExpensePageState();
}

class _AddEditExpensePageState extends State<AddEditExpensePage> {
  late ExpenseController controller;

  final formKey = GlobalKey<FormState>();
  final descriptionEC = TextEditingController();
  final expenseDateEC = TextEditingController();
  final amountEC = TextEditingController();
  var formatter = DateFormat('dd/MM/yyyy');

  DateTime? expanseDate;

  @override
  void initState() {
    controller = widget.controller;

    if (widget.expense != null) {
      descriptionEC.text = widget.expense!.description;
      expenseDateEC.text = formatter.format(widget.expense!.expenseDate);
      amountEC.text = widget.expense!.amount.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    descriptionEC.dispose();
    expenseDateEC.dispose();
    amountEC.dispose();
    super.dispose();
  }

  Future<void> selectDatePicker() async {
    final now = DateTime.now();

    DateTime? result = await showDatePicker(
      context: context,
      initialDate: now,
      locale: const Locale('pt', 'BR'),
      firstDate: DateTime.now().subtract(
        const Duration(days: 365 * 100),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 100),
      ),
    );

    if (result == null) return;

    expanseDate = result.toUtc();
    expenseDateEC.text = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddExpenseButton(
        label: widget.expense != null ? 'Alterar Despesa' : 'Adicionar Despesa',
        icon: widget.expense != null ? const Icon(Icons.edit) : null,
        onPressed: () async => widget.expense != null
            ? await updateExpense()
            : await createExpense(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.expense != null ? 'Alterar Despesa' : 'Adicionar Despesa',
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextFormField(
                  label: 'Descrição',
                  controller: descriptionEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Descrição é obrigatória';
                    }

                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () async => await selectDatePicker(),
                  child: DefaultTextFormField(
                    label: 'Data da Despesa',
                    controller: expenseDateEC,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.date_range),
                    suffixIconFunction: () async => await selectDatePicker(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Data é obrigatória';
                      }

                      return null;
                    },
                  ),
                ),
                DefaultTextFormField(
                  label: 'Valor',
                  controller: amountEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Valor é obrigatório';
                    }

                    RegExp regExp = RegExp(r'^\d+(?:[,.]\d{1,2})?$');

                    if (regExp.firstMatch(value) == null) {
                      return 'Formato inválido';
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Adicionar Imagem',
              style: TextStyle(fontSize: 22),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: PictureContainer(),
          )
        ],
      ),
    );
  }

  Future<void> updateExpense() async {
    if (formKey.currentState!.validate()) {
      final updateExpense = widget.expense!.copyWith(
        description: descriptionEC.text,
        expenseDate: expanseDate,
        amount: double.parse(amountEC.text.replaceAll(',', '.')),
      );

      await controller.updateExpenseUsecase(updateExpense);

      if (context.mounted) Navigator.pop(context);
    }
  }

  Future<void> createExpense() async {
    if (formKey.currentState!.validate()) {
      String latitude = '', longitude = '';

      try {
        var permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.deniedForever) {
          latitude = '';
          longitude = '';
        }

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();

          if (permission == LocationPermission.denied) {
            latitude = '';
            longitude = '';
          }
        } else {
          final position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium);

          latitude = position.latitude.toString();
          longitude = position.longitude.toString();
        }
      } finally {
        final expense = ExpenseEntity(
          description: descriptionEC.text,
          expenseDate: expanseDate!,
          amount: double.parse(amountEC.text.replaceAll(',', '.')),
          latitude: latitude,
          longitude: longitude,
        );

        await controller.createExpenseUsecase(expense);

        if (context.mounted) Navigator.pop(context);
      }
    }
  }
}
