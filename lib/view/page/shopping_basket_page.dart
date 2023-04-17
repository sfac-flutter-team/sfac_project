import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';

class ShoppingBasketPage extends GetView<ShoppingBasketController> {
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
      ),
      body: Obx(
        () => Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.shoppingBasket.length,
              itemBuilder: (context, index) {
                RxInt amount = controller.shoppingBasket[index].quantity.obs;
                return Obx(
                  () => Container(
                    width: 350,
                    height: 182,
                    clipBehavior: Clip.none,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColor.subLightGrey),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 44,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            controller.shoppingBasket[index].product.imageUrl,
                            width: 86,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  controller.shoppingBasket[index].product
                                      .productName,
                                  style: AppTextStyle.bKorPreRegular16,
                                ),
                                Text(controller.shoppingBasket[index]
                                            .selectedOption !=
                                        null
                                    ? controller
                                        .shoppingBasket[index].selectedOption
                                        .toString()
                                    : ''),
                                Row(children: [
                                  IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () => controller
                                          .handleAmountDown(amount, index)),
                                  Text(amount.toString()),
                                  IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => controller
                                          .handleAmountUp(amount, index)),
                                ])
                              ]),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  controller.removeShoppingBasket(index),
                              icon: const Icon(Icons.close),
                            ),
                            Text(
                                '${NumberFormat('###,###,###').format(controller.shoppingBasket[index].product.price * amount.value)} 원')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 99,
            decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text.rich(TextSpan(text: '총 ', children: [
                  TextSpan(
                      text:
                          '${NumberFormat('###,###,###,###').format(controller.totalPrice.value)} 원',
                      style: AppTextStyle.hKorPreSemiBold18(
                          color: AppColor.mainBlue))
                ])),
                SizedBox(
                  width: 184,
                  child: AppElevatedButton(
                      childText: '구매하기',
                      onPressed: () => Get.toNamed(AppRoutes.buyerinfo)),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
