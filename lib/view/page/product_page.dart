import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/product_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_bottom_sheets.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});
  static const route = '/product';

  @override
  Widget build(BuildContext context) {
    var detailList = controller.product.productDetail;
    var optionList = controller.product.option;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.black,
        actions: [
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.shoppingbasket),
              child: Image.asset('assets/icons/cart-shopping.png')),
          Stack(clipBehavior: Clip.none, children: const [
            SizedBox(),
            Positioned(
              top: 3,
              right: 10,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: AppColor.mainBlue,
                child: Text('controller.shoppingList.length.toString()'),
              ),
            ),
          ])
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                Image.network(controller.product.imageUrl),
                Text(
                  controller.product.productName,
                  style: AppTextStyle.bEngPretendard20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${controller.product.price} 원',
                  style: AppTextStyle.hKorPreSemiBold20,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '상세설명',
                  style: TextStyle(color: AppColor.mainBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  controller.product.productInfo,
                  style: AppTextStyle.bKorPreRegular14,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '배송',
                  style: TextStyle(color: AppColor.mainBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(controller.product.delivery,
                    style: AppTextStyle.bKorPreRegular14),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '세부 사항',
                  style: TextStyle(color: AppColor.mainBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (var data in detailList) Text('- ${data}')
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: SizedBox(
                    width: 280,
                    height: 64,
                    child: AppElevatedButton(
                        backgroundColor: AppColor.mainBlue,
                        childText: '구매하기',
                        onPressed: () {}),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
