import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:onfly_test/core/ui/theme_extension.dart';
import 'package:onfly_test/features/expense/data/models/expense_model_extension.dart';
import 'package:onfly_test/features/expense/domain/entities/expense_entity.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/add_expense_button.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/default_text_form_field.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/picture_container.dart';

import '../../controllers/expense_controller.dart';

class AddEditExpensePage extends StatefulWidget {
  final ExpenseEntity? expanse;

  const AddEditExpensePage({super.key, this.expanse});

  @override
  State<AddEditExpensePage> createState() => _AddEditExpensePageState();
}

class _AddEditExpensePageState extends State<AddEditExpensePage> {
  final controller = GetIt.I.get<ExpenseController>();

  final formKey = GlobalKey<FormState>();
  final descriptionEC = TextEditingController();
  final expenseDateEC = TextEditingController();
  final amountEC = TextEditingController();
  DateTime? expanseDate;

  @override
  void dispose() {
    descriptionEC.dispose();
    expenseDateEC.dispose();
    amountEC.dispose();
    super.dispose();
  }

  Future<void> selectDatePicker() async {
    var formatter = DateFormat('dd/MM/yyyy');
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
        label: 'Adicionar',
        onPressed: () async => widget.expanse != null
            ? await updateExpense()
            : await createExpense(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
            widget.expanse != null ? 'Alterar Despesa' : 'Adicionar Despesa'),
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
      final updateExpense = widget.expanse!.copyWith(
        description: descriptionEC.text,
        expenseDate: expanseDate,
        amount: double.parse(amountEC.text.replaceAll(',', '.')),
      );

      await controller.createExpenseUsecase(updateExpense);

      if (context.mounted) Navigator.pop(context);
    }
  }

  Future<void> createExpense() async {
    if (formKey.currentState!.validate()) {
      String latitude = '', longitude = '';

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
