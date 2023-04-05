import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/main_controller.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/util/app_text_style.dart';

class MarketScreen extends GetView<MainController> {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Market',
          style: AppTextStyle.hEngMontBold36,
        ),
        Expanded(
            child: Obx(
          () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {}, //상품 페이지
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Image.network(
                                controller.productList[index].data().imageUrl)),
                        Text(
                          controller.productList[index].data().productName,
                          style: AppTextStyle.bKorPreRegular14,
                        ),
                        Text(
                          controller.productList[index].data().price,
                          style: AppTextStyle.bKorPreRegular18,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ))
      ],
    );
  }
}
