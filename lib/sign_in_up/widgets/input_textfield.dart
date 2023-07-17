import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool isPass;

  const InputTextField({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: inputBorder,
        hintText: hintText,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        contentPadding: const EdgeInsets.all(8),
        filled: true,
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please Enter your $hintText';
        }
        return null;
      },
      obscureText: isPass,
      keyboardType: textInputType,
    );
  }
}
