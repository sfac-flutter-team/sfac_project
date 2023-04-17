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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.purchaseList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 350,
                        height: 153,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                controller.purchaseList[index]
                                    .data()
                                    .shoppingBasket[index]
                                    .product
                                    .imageUrl,
                                width: 86,
                                height: 120,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.purchaseList[index]
                                    .data()
                                    .shoppingBasket[index]
                                    .product
                                    .productName),
                                Text(
                                    '${NumberFormat('###,###').format(controller.purchaseList[index].data().shoppingBasket[index].product.price)} 원')
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
