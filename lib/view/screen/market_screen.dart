import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/market_controller.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';

class MarketScreen extends GetView<MarketController> {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Market',
                style: AppTextStyle.hEngMontBold36,
              ),
              GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.shoppingbasket),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Image.asset('assets/icons/cart-shopping.png'),
                    const Positioned(
                      top: -10,
                      right: 3,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColor.mainBlue,
                        child:
                            Text('controller.shoppingList.length.toString()'),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    )
                  ]))
            ],
          ),
          Expanded(
              child: Obx(
            () => GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.product,
                          arguments: controller.productList[index].data());
                    }, //상품 페이지
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Image.network(controller.productList[index]
                                  .data()
                                  .imageUrl)),
                          Text(
                            controller.productList[index].data().productName,
                            style: AppTextStyle.bKorPreRegular14(),
                          ),
                          Text(
                            '${controller.productList[index].data().price} 원',
                            style: AppTextStyle.bKorPreRegular18,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
