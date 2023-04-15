import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColor.mainBlue,
    );
  }
}
