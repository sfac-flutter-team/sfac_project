import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/buyer_info_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';
import 'package:sfac_project/view/widget/app_text_field.dart';

class BuyerInfoPage extends GetView<BuyerInfoController> {
  const BuyerInfoPage({super.key});
  static const route = '/buyerinfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                const Text('구매자 정보 입력', style: AppTextStyle.hKorPreBold24),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  hintText: '이름',
                  controller: controller.nameController,
                  onChanged: (_) => controller.activateButton(),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                    hintText: '전화번호',
                    onChanged: (_) => controller.activateButton(),
                    controller: controller.phonenumController),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: AppTextField(
                        hintText: '우편번호',
                        controller: controller.postcodeController,
                        onChanged: (_) => controller.activateButton(),
                        readOnly: true,
                      ),
                    ),
                    CupertinoButton(
                        child: const Text('주소 검색'),
                        onPressed: () => controller.searchAddress(context)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                  hintText: '기본주소',
                  controller: controller.addressController,
                  onChanged: (_) => controller.activateButton(),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                AppTextField(
                    hintText: '상세주소를 입력해주세요',
                    onChanged: (_) => controller.activateButton(),
                    controller: controller.addressDetailController)
              ]),
            ),
            const Text('현재 결제는 무통장 입금만 가능합니다 ㅎㅎ'),
            Obx(
              () => AppElevatedButton(
                  childText: '구매하기',
                  onPressed: controller.isButtonActivate.value
                      ? controller.handlePurchaseButton
                      : null),
            )
          ],
        ),
      ),
    );
  }
}
