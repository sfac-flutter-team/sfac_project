import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/model/shoppingbasket.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_dialog.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});
  static const route = '/calculate';

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var arg = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '결제하기',
          style: AppTextStyle.hKorPreSemiBold20(color: AppColor.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.mainBlue,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      '총 결제 금액',
                      style: AppTextStyle.hKorPreSemiBold24(),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '${NumberFormat('###,###,###').format(arg.totalPrice)}원',
                      style:
                          AppTextStyle.hKorPreBold36(color: AppColor.mainBlue),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      children: [
                        Text(
                          '결제방식',
                          style: AppTextStyle.hKorPreSemiBold24(),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '아래 계좌로 입금해 주세요.',
                          style: AppTextStyle.hKorPreSemiBold17(
                              color: AppColor.subDarkGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 350,
                      height: 94,
                      decoration: BoxDecoration(
                          color: AppColor.darkWhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '은행 이름 666666-66-666666',
                          style: AppTextStyle.hKorPreSemiBold20(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
              textAlign: TextAlign.center,
              '입금이 확인되면 내 정보 페이지의 구매내역에서\n배송 조회를 할 수 있습니다.',
              style:
                  AppTextStyle.bKorPreRegular14(color: AppColor.subDarkGrey)),
          const SizedBox(height: 46),
          Container(
            height: 99,
            decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3)), // changes position of shadow
              ],
            ),
            child: Center(
              child: SizedBox(
                width: 280,
                height: 64,
                child: AppElevatedButton(
                  childText: '확인',
                  onPressed: () => Get.dialog(AppDialog(
                      content: '대충 입금확인한다는 텍스트',
                      onCancel: () => Get.back(),
                      onConfirm: () => Get.until(
                          (route) => route.settings.name == AppRoutes.main),
                      cancelText: '취소',
                      confirmText: '확인')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
