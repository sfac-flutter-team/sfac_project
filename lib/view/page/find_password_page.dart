import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/find_password_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';
import 'package:sfac_project/view/widget/app_text_field.dart';

class FindPasswordPage extends GetView<FindPasswordController> {
  const FindPasswordPage({super.key});
  static const route = '/findPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.mainBlue,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 18.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                style: AppTextStyle.hKorPreSemiBold36,
                '비밀번호 찾기',
              ),
              const SizedBox(height: 88),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      hintText: '이메일을 입력하세요',
                      controller: controller.pwFindController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        style: AppTextStyle.bKorPreRegular14(
                            color: AppColor.subDarkGrey),
                        '비밀번호 재설정 메일을 보냅니다.',
                      ),
                    ),
                    const SizedBox(height: 47),
                    AppElevatedButton(
                      childText: '확인',
                      onPressed: () => controller
                          .resetPassword(controller.pwFindController.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
