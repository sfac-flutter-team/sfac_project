import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/login_controller.dart';
import 'package:sfac_project/view/widget/elecatedbutton.dart';

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
                  () => ElevatedActivateButton(
                    onPressed: controller.login,
                    childText: '로그인',
                    isActivateButton: controller.isButtonActivate.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
