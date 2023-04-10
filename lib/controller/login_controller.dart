import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/view/page/main_page.dart';
import 'package:sfac_project/view/widget/app_dialog.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();

  RxBool isAutoLoginChecked =
      Get.find<AuthController>().isPersisted.obs; //자동로그인 체크
  RxBool isButtonActivate = false.obs; //로그인 버튼 비활성화

  //로그인 불러오고 값이 없으면 스낵바출력
  login() async {
    if (await Get.find<AuthController>().login(
        emailController.text, pwController.text, isAutoLoginChecked.value)) {
      Get.offAllNamed(MainPage.route);
    } else {
      Get.dialog(
        AppDialog(
          content: '존재하지 않는 회원 정보입니다.',
          cancelText: '닫기',
          confirmText: '확인',
          onCancel: () => Get.back(),
          onConfirm: () => Get.back(),
        ),
      );
    }
  }

  signInWithGoogle() => Get.find<AuthController>().signInWithGoogle();

  //로그인버튼 활성화하는 함수
  activateButton() {
    if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
      isButtonActivate.value = true;
    } else {
      isButtonActivate.value = false;
    }
  }

  handleAutoLoginCheck(bool? value) {
    isAutoLoginChecked(value);
    Get.find<AuthController>().isPersisted = isAutoLoginChecked.value;
  }
}
