import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/purchase_history_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/purchase_card.dart';

class PurchaseHistoryPage extends GetView<PurchaseHistoryController> {
  const PurchaseHistoryPage({super.key});
  static const route = '/purchasehistory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.mainBlue,
        foregroundColor: AppColor.white,
        title: Text(
          style: AppTextStyle.hKorPreSemiBold20(color: AppColor.white),
          '구매내역',
        ),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: AppProgressIndicator());
        } else {
          if (controller.purchaseList.isNotEmpty) {
            return ListView.builder(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                itemCount: controller.purchaseList.length,
                itemBuilder: (context, parentIdx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Text(
                          style: AppTextStyle.hKorPreSemiBold16(),
                          DateFormat('yy.MM.dd').format(
                            controller.purchaseList[parentIdx].data().orderDate,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.purchaseList[parentIdx]
                            .data()
                            .shoppingBasket
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: PurchaseCard(
                              purchase:
                                  controller.purchaseList[parentIdx].data(),
                              productIndex: index,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                style: AppTextStyle.bKorPreRegular20(color: AppColor.mainBlue),
                '구매 내역이 없습니다.',
              ),
            );
          }
        }
      }),
    );
  }
}
