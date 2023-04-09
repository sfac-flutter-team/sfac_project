import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/signup_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';
import 'package:sfac_project/view/widget/app_text_field.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const route = '/signup';

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
        child: LayoutBuilder(
          builder: (context, constraint) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    style: AppTextStyle.hKorPreSemiBold36,
                    '회원가입',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        Obx(
                          () => AppTextField(
                            hintText: '이메일을 입력하세요',
                            errorText: controller.emailError.value,
                            controller: controller.emailController,
                            onChanged: (value) =>
                                controller.checkEmailValidation(value),
                          ),
                        ),
                        const SizedBox(height: 44),
                        Obx(
                          () => AppTextField(
                            obscure: true,
                            hintText: '비밀번호를 입력하세요',
                            errorText: controller.pwError.value,
                            controller: controller.pwController,
                            onChanged: (value) =>
                                controller.checkPasswordValidation(value),
                          ),
                        ),
                        const SizedBox(height: 44),
                        Obx(
                          () => AppTextField(
                            obscure: true,
                            hintText: '비밀번호를 다시 입력하세요',
                            errorText: controller.pwConfirmError.value,
                            controller: controller.pwConfirmController,
                            onChanged: (value) => controller
                                .checkPasswordConfirmValidation(value),
                          ),
                        ),
                        const SizedBox(height: 44),
                        Obx(
                          () => AppTextField(
                            hintText: '닉네임을 입력하세요',
                            errorText: controller.nickNameError.value,
                            controller: controller.nickNameController,
                            onChanged: (value) =>
                                controller.checkNickNameValidation(value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => AppElevatedButton(
                      childText: '회원가입',
                      onPressed: controller.isButtonActivated.value
                          ? controller.signup
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
