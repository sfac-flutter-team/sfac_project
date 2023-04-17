// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.content,
    required this.onCancel,
    required this.onConfirm,
    required this.cancelText,
    required this.confirmText,
  }) : super(key: key);

  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final String cancelText;
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: AppTextStyle.bKorPreRegular20(),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: onCancel,
                child: Text(
                  cancelText,
                  style: AppTextStyle.hKorPreSemiBold20(),
                ),
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  thickness: 1,
                ),
              ),
              TextButton(
                onPressed: onConfirm,
                child: Text(
                  confirmText,
                  style:
                      AppTextStyle.hKorPreSemiBold20(color: AppColor.mainBlue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
