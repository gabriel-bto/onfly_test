import 'package:flutter/material.dart';

class AddExpenseButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Icon? icon;

  const AddExpenseButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 215,
      height: 59,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: icon ??
                  const Icon(
                    Icons.add_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
