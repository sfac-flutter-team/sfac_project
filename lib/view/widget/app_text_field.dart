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
      cursorColor: AppColor.subGrey,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: AppTextStyle.hKorPreSemiBold16(
          color: AppColor.subGrey,
        ),
        errorText: errorText,
        errorStyle: AppTextStyle.bKorPreRegular14(
          color: AppColor.mainBlue,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.subLightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.subLightGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.subLightGrey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.subLightGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
