import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: '이메일을 입력하세요',
                    errorText: controller.emailError.value,
                  ),
                  onChanged: (value) => controller.checkEmailValidation(value),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextField(
                  controller: controller.pwController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요',
                    errorText: controller.pwError.value,
                  ),
                  onChanged: (value) =>
                      controller.checkPasswordValidation(value),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextField(
                  controller: controller.pwConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '비밀번호를 다시 입력하세요',
                    errorText: controller.pwConfirmError.value,
                  ),
                  onChanged: (value) =>
                      controller.checkPasswordConfirmValidation(value),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextField(
                  controller: controller.nickNameController,
                  decoration: InputDecoration(
                    hintText: '닉네임을 입력하세요',
                    errorText: controller.nickNameError.value,
                  ),
                  onChanged: (value) =>
                      controller.checkNickNameValidation(value),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isButtonActivated.value
                      ? controller.signup
                      : null,
                  child: const Text('회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
