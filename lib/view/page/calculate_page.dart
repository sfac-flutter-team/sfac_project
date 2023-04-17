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
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.black,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '결제하기',
                      style: AppTextStyle.hKorPreBold24,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('총 결제 금액'),
                    Text(
                      '${NumberFormat('###,###,###').format(arg.totalPrice)}원',
                      style: AppTextStyle.hEngMontSemiBold24,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text('아래의 계좌번호로 입금해 주시길 바랍니다.'),
                    const Text(
                      '계좌번호',
                      style: AppTextStyle.hKorPreBold24,
                    ),
                    const Text(
                      '3333-04-9138692 카카오뱅크 신승호',
                      style: AppTextStyle.bEngPretendard20,
                    ),
                  ],
                ),
              ),
            ),
            AppElevatedButton(
              childText: '확인',
              onPressed: () => Get.dialog(AppDialog(
                  content: '돈안보냈죠?ㅋ',
                  onCancel: () => Get.back(),
                  onConfirm: () => Get.until(
                      (route) => route.settings.name == AppRoutes.main),
                  cancelText: '취소',
                  confirmText: '확인')),
            )
          ],
        ),
      ),
    );
  }
}
