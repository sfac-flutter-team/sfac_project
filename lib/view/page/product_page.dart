import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/buyer_info_controller.dart';
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
                  Text(
                    '상세설명',
                    style: AppTextStyle.hKorPreSemiBold18(
                        color: AppColor.mainBlue),
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
                  Text(
                    '배송',
                    style: AppTextStyle.hKorPreSemiBold18(
                        color: AppColor.mainBlue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.product.delivery,
                      style: AppTextStyle.bKorPreRegular14()),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '세부 사항',
                    style: AppTextStyle.hKorPreSemiBold18(
                        color: AppColor.mainBlue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var data in widget.product.productDetail)
                    Text('- ${data}')
                ]),
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
              child: Center(
                child: SizedBox(
                  width: 280,
                  height: 64,
                  child: AppElevatedButton(
                    childText: '구매하기',
                    onPressed: () {
                      Get.bottomSheet(
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter bottomState) =>
                                  AppBottomSheet(
                            height: MediaQuery.of(context).size.height / 2,
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
                                Container(
                                  height: 99,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 280,
                                      height: 64,
                                      child: AppElevatedButton(
                                        childText: '선택 완료',
                                        onPressed: () {
                                          Get.back();
                                          Get.bottomSheet(
                                            StatefulBuilder(
                                              builder: (BuildContext context,
                                                      StateSetter
                                                          bottomState) =>
                                                  AppBottomSheet(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              selectedOption ??
                                                                  '선택된 옵션이 없습니다.',
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .remove),
                                                                    onPressed: () =>
                                                                        bottomState(
                                                                            () {
                                                                          handleAmountDown();
                                                                        })),
                                                                Text(amount
                                                                    .toString()),
                                                                IconButton(
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add),
                                                                  onPressed: () =>
                                                                      bottomState(
                                                                          () {
                                                                    handleAmountUp();
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                                '총 ${NumberFormat('###,###,###').format(widget.product.price * amount)}원'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 99,
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 5,
                                                            blurRadius: 7,
                                                            offset: const Offset(
                                                                0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: 163,
                                                            child:
                                                                AppElevatedButton(
                                                              childText: '바로구매',
                                                              onPressed: () {
                                                                Get.toNamed(
                                                                    AppRoutes
                                                                        .buyerinfo,
                                                                    arguments: {
                                                                      'shoppingBasket': ShoppingBasket(
                                                                          quantity:
                                                                              amount,
                                                                          product: widget
                                                                              .product,
                                                                          selectedOption:
                                                                              selectedOption),
                                                                      'buyType':
                                                                          BuyType
                                                                              .fromProductPage,
                                                                    });
                                                              },
                                                              buttonType:
                                                                  ButtonType
                                                                      .white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 163,
                                                            child:
                                                                AppElevatedButton(
                                                              childText: '장바구니',
                                                              onPressed: () {
                                                                handleOnPurchase();
                                                                Get.back();
                                                              },
                                                            ),
                                                          ),
                                                        ],
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
          ],
        ),
      ),
    );
  }
}
