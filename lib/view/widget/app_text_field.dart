import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onChanged,
      this.errorText,
      this.obscure = false});

  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? errorText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: AppTextStyle.hKorPreSemiBold16(
          color: AppColor.subLightGrey,
        ),
        errorText: errorText,
        errorStyle: AppTextStyle.bKorPreRegular14(
          color: AppColor.subDarkGrey,
        ),
        filled: true,
        fillColor: AppColor.tempGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
