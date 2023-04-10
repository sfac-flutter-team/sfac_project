import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/view/widget/app_dialog.dart';

class FindPasswordController extends GetxController {
  var pwFindController = TextEditingController();

  Future<void> resetPassword(String email) async {
    Get.find<AuthController>().resetPassword(email);
    await Get.dialog(
      AppDialog(
        content: '이메일 전송 성공\n메일함을 확인해주세요!',
        cancelText: '닫기',
        confirmText: '확인',
        onCancel: () => Get.back(),
        onConfirm: () => Get.back(),
      ),
    );
    Get.back();
  }
}
