import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

enum ButtonType { blue, white }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.childText,
    required this.onPressed,
    this.buttonType = ButtonType.blue,
  });

  final Function()? onPressed;
  final String childText;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: buttonType == ButtonType.blue
              ? AppColor.mainBlue
              : AppColor.white,
          disabledBackgroundColor: AppColor.subGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: buttonType == ButtonType.blue
                ? BorderSide.none
                : const BorderSide(
                    color: AppColor.mainBlue,
                  ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            style: buttonType == ButtonType.blue
                ? AppTextStyle.hKorPreSemiBold18(color: AppColor.white)
                : AppTextStyle.hKorPreSemiBold18(color: AppColor.mainBlue),
            childText,
          ),
        ),
      ),
    );
  }
}
