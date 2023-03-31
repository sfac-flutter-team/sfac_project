import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.childText,
      required this.isActivateButton});

  final VoidCallback onPressed;
  final String childText;
  final bool isActivateButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActivateButton ? onPressed : null,
      child: Text(childText),
    );
  }
}
