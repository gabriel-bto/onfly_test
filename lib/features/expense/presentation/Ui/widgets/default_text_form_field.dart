import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String label;
  final Icon? suffixIcon;
  final Function()? suffixIconFunction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool readOnly;

  const DefaultTextFormField({
    super.key,
    required this.label,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.suffixIconFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIconFunction != null
                  ? GestureDetector(
                      onTap: suffixIconFunction,
                      child: suffixIcon,
                    )
                  : suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
