import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key, required this.childText, required this.onPressed});

  final String childText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.subGrey,
      ),
      onPressed: onPressed,
      child: Text(
        style: AppTextStyle.bKorPreRegular14(),
        childText,
      ),
    );
  }
}
