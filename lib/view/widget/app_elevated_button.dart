import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.childText,
    required this.onPressed,
  });

  final Function()? onPressed;
  final String childText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainBlue,
          disabledBackgroundColor: AppColor.subGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            style: AppTextStyle.hKorPreSemiBold18(color: AppColor.white),
            childText,
          ),
        ),
      ),
    );
  }
}