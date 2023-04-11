import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class ShoppingBasketPage extends StatelessWidget {
  const ShoppingBasketPage({super.key});
  static const route = '/shoppingbasket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.mainBlue,
        foregroundColor: AppColor.white,
        title: const Text('장바구니'),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                '상품 삭제',
                style: TextStyle(color: AppColor.white),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '나 장바구니 페이지',
              style: AppTextStyle.hKorPreBold36,
            ),
            TextButton(onPressed: () {}, child: Text('쇼핑카트 JSON'))
          ],
        ),
      ),
    );
  }
}
