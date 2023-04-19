import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/buyer_info_controller.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
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
                    margin: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: AppColor.white),
                    child: Column(
                      children: [
                        Container(
                          alignment: const Alignment(0.93, 0),
                          child: IconButton(
                              onPressed: () =>
                                  controller.removeShoppingBasket(index),
                              icon: const Icon(Icons.close)),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 44),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                controller
                                    .shoppingBasket[index].product.imageUrl,
                                width: 86,
                                height: 120,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.shoppingBasket[index].product
                                            .productName,
                                        style: AppTextStyle.bKorPreRegular15),
                                    const SizedBox(height: 10),
                                    Text(
                                        controller.shoppingBasket[index]
                                                    .selectedOption !=
                                                null
                                            ? controller.shoppingBasket[index]
                                                .selectedOption
                                                .toString()
                                            : '',
                                        style: AppTextStyle.bKorPreRegular14(
                                            color: AppColor.subDarkGrey)),
                                    const SizedBox(height: 10),
                                    Row(children: [
                                      InkWell(
                                          onTap: () => controller
                                              .handleAmountDown(amount, index),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: amount == 1
                                                      ? AppColor.subGreyd9
                                                      : AppColor.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: amount == 1
                                                          ? AppColor.subGreyd9
                                                          : AppColor.subGrey)),
                                              child: const Icon(Icons.remove))),
                                      const SizedBox(width: 8),
                                      Text(amount.toString(),
                                          style:
                                              AppTextStyle.hKorPreSemiBold15()),
                                      const SizedBox(width: 8),
                                      InkWell(
                                          onTap: () => controller
                                              .handleAmountUp(amount, index),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: AppColor.subGrey)),
                                              child: const Icon(Icons.add))),
                                    ]),
                                    Container(
                                      alignment: const Alignment(0.7, 0),
                                      child: Text(
                                        '${NumberFormat('###,###,###').format(controller.shoppingBasket[index].product.price * amount.value)} 원',
                                        style: AppTextStyle.hKorPreSemiBold16(),
                                      ),
                                    ),
                                  ]),
                            ),
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
                    offset: const Offset(0, 3)),
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
                    onPressed: controller.isButtonActivated.value
                        ? () => Get.toNamed(AppRoutes.buyerinfo, arguments: {
                              'buyType': BuyType.fromShppingBasketPage
                            })
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
