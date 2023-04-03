import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onChanged,
      this.errorText,
      this.obscureText = false});

  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? errorText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(hintText: hintText, errorText: errorText),
    );
  }
}
