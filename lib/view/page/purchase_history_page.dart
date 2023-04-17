import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/purchase_history_controller.dart';
import 'package:sfac_project/util/app_color.dart';

class PurchaseHistoryPage extends GetView<PurchaseHistoryController> {
  const PurchaseHistoryPage({super.key});
  static const route = '/purchasehistory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('구매내역'),
        backgroundColor: AppColor.mainBlue,
        foregroundColor: AppColor.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.purchaseList.length,
                  itemBuilder: (context, parentIdx) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.purchaseList[parentIdx]
                          .data()
                          .shoppingBasket
                          .length,
                      itemBuilder: (context, index) {
                        var currentProduct = controller.purchaseList[parentIdx]
                            .data()
                            .shoppingBasket[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 46, vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 9,
                                  offset: const Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.network(
                                  controller.purchaseList[parentIdx]
                                      .data()
                                      .shoppingBasket[index]
                                      .product
                                      .imageUrl,
                                  width: 86,
                                  height: 120,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      currentProduct.product.productName,
                                    ),
                                    Text(
                                        '${NumberFormat('###,###').format(currentProduct.product.price * currentProduct.quantity)} 원'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
