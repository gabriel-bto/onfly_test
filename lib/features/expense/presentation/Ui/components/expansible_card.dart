import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:onfly_test/core/ui/theme_extension.dart';
import 'package:onfly_test/features/expense/presentation/Ui/widgets/picture_container.dart';

import '../../controllers/expense_controller.dart';
import '../models/expense_model.dart';

class ExpansibleCard extends StatefulWidget {
  final ExpenseModel expense;

  const ExpansibleCard({
    Key? key,
    required this.expense,
  }) : super(key: key);

  @override
  State<ExpansibleCard> createState() => _ExpansibleCardState();
}

class _ExpansibleCardState extends State<ExpansibleCard> {
  var formatter = DateFormat('dd/MM/yyyy');
  final isExpanded = ValueNotifier<bool>(false);

  final controller = GetIt.I.get<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (_, bool value, __) {
        return SizedBox(
          height: value ? 592 : 91,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.expense.description,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 4),
                            Text(formatter.format(widget.expense.expenseDate)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('R\$ ${widget.expense.amount}'),
                          Visibility(
                            visible: widget.expense.isCreate ||
                                widget.expense.isRemove ||
                                widget.expense.isUpdate,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Icon(Icons.cloud_off, color: Colors.black),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Transform.rotate(
                              angle: 180 * math.pi / 120,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                onPressed: () =>
                                    isExpanded.value = !isExpanded.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                          visible: value,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const PictureContainer(),
                              const SizedBox(height: 18),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                        color: context.primaryColor,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await controller.removeExpenseFromIdUsecase(
                                          widget.expense.id!);
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 22),
                                        Icon(
                                          Icons.delete,
                                          color: context.primaryColor,
                                        ),
                                        const SizedBox(width: 40),
                                        Text(
                                          'Apagar',
                                          style: TextStyle(
                                            color: context.primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await controller.removeExpenseFromIdUsecase(
                                          widget.expense.id!);
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(width: 22),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 40),
                                        Text(
                                          'Apagar',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
