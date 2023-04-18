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
        title: Text(
          '구매자 정보 입력',
          style: AppTextStyle.hKorPreSemiBold20(color: AppColor.black),
        ),
        centerTitle: true,
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                const SizedBox(height: 30),
                Text('받는분', style: AppTextStyle.hKorPreSemiBold16()),
                const SizedBox(height: 10),
                AppTextField(
                  hintText: '이름',
                  controller: controller.nameController,
                  onChanged: (_) => controller.activateButton(),
                ),
                const SizedBox(height: 20),
                Text('전화번호', style: AppTextStyle.hKorPreSemiBold16()),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                    hintText: '전화번호',
                    onChanged: (_) => controller.activateButton(),
                    controller: controller.phonenumController),
                const SizedBox(height: 20),
                Text('우편번호', style: AppTextStyle.hKorPreSemiBold16()),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: AppTextField(
                        filled: true,
                        hintText: '우편번호',
                        controller: controller.postcodeController,
                        onChanged: (_) => controller.activateButton(),
                        readOnly: true,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.darkWhite,
                          borderRadius: BorderRadius.circular(20)),
                      child: CupertinoButton(
                          child: Text('우편번호 검색',
                              style: AppTextStyle.hKorPreSemiBold16()),
                          onPressed: () => controller.searchAddress(context)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('주소', style: AppTextStyle.hKorPreSemiBold16()),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  filled: true,
                  hintText: '주소',
                  controller: controller.addressController,
                  onChanged: (_) => controller.activateButton(),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                Text('상세주소', style: AppTextStyle.hKorPreSemiBold16()),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                    hintText: '상세주소를 입력해주세요',
                    onChanged: (_) => controller.activateButton(),
                    controller: controller.addressDetailController),
                const SizedBox(height: 40),
                SizedBox(
                    width: double.infinity,
                    height: 49,
                    child: Text('현재 결제는 무통장 입금만 가능합니다.',
                        style: AppTextStyle.bKorPreRegular14(
                            color: AppColor.subDarkGrey),
                        textAlign: TextAlign.center)),
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
                child: Obx(
                  () => AppElevatedButton(
                      childText: '결제하기',
                      onPressed: controller.isButtonActivate.value
                          ? controller.handlePurchaseButton
                          : null),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
