import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/util/app_routes.dart';

class FindPasswordController extends GetxController {
  var pwFindController = TextEditingController();

  Future<void> resetPassword(String email) async {
    Get.find<AuthController>().resetPassword(email);
    Get.snackbar("비밀번호 재인증", "메일을 성공적으로 보냈습니다");
    Get.toNamed(AppRoutes.login);
  }
}
