import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/login_controller.dart';
import 'package:sfac_project/firebase_options.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_elevated_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: controller.emailController,
                  onChanged: (_) => controller.activateButton(),
                  decoration: InputDecoration(hintText: '이메일을 입력하세요'),
                ),
                TextField(
                  obscureText: true,
                  controller: controller.pwController,
                  onChanged: (_) => controller.activateButton(),
                  decoration: InputDecoration(hintText: '비밀번호를 입력하세요.'),
                ),
                Obx(
                  () => AppElevatedButton(
                    onPressed: controller.isButtonActivate.value
                        ? controller.login
                        : null,
                    childText: '로그인',
                  ),
                ),
                TextButton(
                  onPressed: controller.signInWithGoogle,
                  child: const Text('구글 로그인'),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.signup),
                  child: const Text('회원가입'),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.findPassword),
                  child: const Text('비밀번호 찾기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
