import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/login_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';
import 'package:sfac_project/view/widget/app_text_button.dart';
import 'package:sfac_project/view/widget/app_text_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                    width: 340, height: 80, 'assets/images/app_logo.png'),
                const SizedBox(height: 30),
                AppTextField(
                  controller: controller.emailController,
                  onChanged: (_) => controller.activateButton(),
                  hintText: '이메일',
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: controller.pwController,
                  onChanged: (_) => controller.activateButton(),
                  hintText: '비밀번호',
                  obscure: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          activeColor: AppColor.mainBlue,
                          shape: const CircleBorder(),
                          value: controller.isAutoSigningOn.value,
                          onChanged: (value) =>
                              controller.isAutoSigningOn(value),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      style: AppTextStyle.bKorPreRegular14(),
                      '자동 로그인',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Obx(
                  () => AppElevatedButton(
                    onPressed: controller.isButtonActivate.value
                        ? controller.login
                        : null,
                    childText: '로그인',
                  ),
                ),
                const SizedBox(height: 20),
                AppElevatedButton(
                  onPressed: controller.signInWithGoogle,
                  childText: '구글로 로그인',
                  buttonType: ButtonType.white,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButton(
                      childText: '회원가입',
                      onPressed: () => Get.toNamed(AppRoutes.signup),
                    ),
                    const SizedBox(width: 8),
                    AppTextButton(
                      childText: '비밀번호 찾기',
                      onPressed: () => Get.toNamed(AppRoutes.findPassword),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
