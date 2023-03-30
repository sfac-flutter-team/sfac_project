import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();

  RxBool isButtonActivate = false.obs; //로그인 버튼 비활성화

  //로그인 불러오고 값이 없으면 스낵바출력
  login() async {
    if (await Get.find<AuthController>()
        .login(emailController.text, pwController.text)) {
      // Get.offAllNamed(메인페이지로 이동);
    } else {
      Get.snackbar('로그인 오류!!', '존재하지 않는 회원 정보입니다.',
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //로그인버튼 활성화하는 함수
  activateButton() {
    if (emailController.text.isNotEmpty && pwController.text.isNotEmpty) {
      isButtonActivate(true);
    } else {
      isButtonActivate;
    }
  }
}