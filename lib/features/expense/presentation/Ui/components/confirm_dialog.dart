import 'package:flutter/material.dart';

Future<bool?> confirmDialog(BuildContext context) {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Confirmação'),
      content: const Text('Tem certeza que deseja excluir a despesa?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}
