import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sfac_project/util/app_text_style.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Market',
          style: AppTextStyle.hEngMontBold36,
        ),
        Text(
          '마켓페이지',
          style: AppTextStyle.bKorPreRegular20,
        )
      ],
    );
  }
}
