import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(hintText: '이메일을 입력하세요'),
                ),
                TextField(
                  controller: controller.pwController,
                  decoration: InputDecoration(hintText: '비밀번호를 입력하세요.'),
                ),
                ElevatedButton(
                    onPressed: controller.login,
                    onFocusChange: controller.isButtonActivate,
                    child: Text(
                      '로그인',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
