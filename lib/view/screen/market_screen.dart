import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/market_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';

class MarketScreen extends GetView<MarketController> {
  const MarketScreen({super.key});
  static const route = '/market_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 62,
                  height: 42.74,
                ),
                GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.shoppingbasket),
                    child: Stack(clipBehavior: Clip.none, children: [
                      Image.asset('assets/icons/cart-shopping.png'),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColor.mainBlue,
                          child: Obx(
                            () => Text(
                              controller.shoppingList.length.toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ]))
              ],
            ),
            const SizedBox(height: 38),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.product,
                            arguments: controller.productList[index].data(),
                          );
                        }, //상품 페이지
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(13)),
                                width: 146,
                                height: 202,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(controller
                                              .productList[index]
                                              .data()
                                              .imageUrl))),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: Text(
                                  controller.productList[index]
                                      .data()
                                      .productName,
                                  style: AppTextStyle.bKorPreRegular15,
                                ),
                              ),
                              const SizedBox(height: 13),
                              Text(
                                '${NumberFormat('###,###,###').format(controller.productList[index].data().price)} 원',
                                style: AppTextStyle.hKorPreSemiBold18(),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
