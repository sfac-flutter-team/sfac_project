import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/find_password_controller.dart';

class FindPasswordPage extends GetView<FindPasswordController> {
  const FindPasswordPage({super.key});
  static const route = '/findPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("이메일을 입력해주세요"),
          TextField(
            controller: controller.pwFindController,
          ),
          TextButton(
              onPressed: () {
                controller.resetPassword(controller.pwFindController.text);
              },
              child: Text("확인"))
        ],
      ),
    );
  }
}
