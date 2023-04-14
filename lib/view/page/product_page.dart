import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/shoppingbasket.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_bottom_sheets.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});
  static const route = '/product';
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int amount = 1;
  int selectedOptionIdx = 0;
  String? selectedOption;
  var shoppingBasketController = Get.find<ShoppingBasketController>();

  handleOnPurchase() {
    // print('상품을 주문합니다')
    shoppingBasketController.addShoppingBasket(ShoppingBasket(
        quantity: amount,
        selectedOption: selectedOption,
        product: widget.product));
  }

  handleSelectOption(index) {
    setState(() {
      selectedOptionIdx = index;
      selectedOption = widget.product.option?[selectedOptionIdx];
    });
  }

  handleAmountUp() {
    setState(() {
      amount += 1;
    });
  }

  handleAmountDown() {
    if (amount > 1) {
      setState(() {
        amount -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.black,
        actions: [
          GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.shoppingbasket),
              child: Image.asset('assets/icons/cart-shopping.png')),
          Stack(clipBehavior: Clip.none, children: [
            const SizedBox(),
            Positioned(
              top: 3,
              right: 10,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: AppColor.mainBlue,
                child: Obx(
                  () => Text(
                    shoppingBasketController.shoppingBasket.value.length
                        .toString(),
                    style: AppTextStyle.bEngPretendard14,
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  Image.network(widget.product.imageUrl),
                  Text(
                    widget.product.productName,
                    style: AppTextStyle.bEngPretendard20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${NumberFormat('###,###,###').format(widget.product.price)} 원',
                    style: AppTextStyle.hKorPreSemiBold20(),
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
                    widget.product.productInfo,
                    style: AppTextStyle.bKorPreRegular14(),
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
                  Text(widget.product.delivery,
                      style: AppTextStyle.bKorPreRegular14()),
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
                  for (var data in widget.product.productDetail)
                    Text('- ${data}')
                ]),
              ),
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
                      childText: '구매하기',
                      onPressed: () {
                        Get.bottomSheet(
                          StatefulBuilder(
                            builder: (BuildContext context,
                                    StateSetter bottomState) =>
                                AppBottomSheet(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('옵션 선택'),
                                  ),
                                  if (widget.product.option == null)
                                    const Text('선택할 옵션이 없습니다.'),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          widget.product.option?.length ?? 0,
                                      itemBuilder: (context, index) => Material(
                                        child: ListTile(
                                          onTap: () {
                                            bottomState(() {
                                              handleSelectOption(index);
                                            });
                                          },
                                          selectedTileColor:
                                              AppColor.lightskyBlue,
                                          selected: selectedOptionIdx == index,
                                          title: Text(
                                            widget.product.option![index],
                                            style: const TextStyle(
                                                color: AppColor.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: AppElevatedButton(
                                      childText: '선택 완료',
                                      onPressed: () {
                                        Get.back();
                                        Get.bottomSheet(
                                          StatefulBuilder(
                                            builder: (BuildContext context,
                                                    StateSetter bottomState) =>
                                                AppBottomSheet(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    selectedOption ??
                                                        '선택된 옵션이 없습니다.',
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          icon: const Icon(
                                                              Icons.remove),
                                                          onPressed: () =>
                                                              bottomState(() {
                                                                handleAmountDown();
                                                              })),
                                                      Text(amount.toString()),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.add),
                                                        onPressed: () =>
                                                            bottomState(() {
                                                          handleAmountUp();
                                                        }),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                      '총 ${NumberFormat('###,###,###').format(widget.product.price * amount)}원'),
                                                  AppElevatedButton(
                                                    childText: '장바구니',
                                                    onPressed: () {
                                                      handleOnPurchase();
                                                      Get.back();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
