import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';

class FindPasswordPage extends GetView<AuthController> {
  const FindPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("이메일을 입력해주세요"),
          TextField(controller: controller.pwFindController,),
          TextButton(onPressed: (){
            controller.resetPassword(controller.pwFindController.text);
          }, child: Text("확인"))
        ],
      ),
    );
}
}