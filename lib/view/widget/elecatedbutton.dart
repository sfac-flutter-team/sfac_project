import 'package:flutter/material.dart';

class ElevatedActivateButton extends StatelessWidget {
  const ElevatedActivateButton(
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
