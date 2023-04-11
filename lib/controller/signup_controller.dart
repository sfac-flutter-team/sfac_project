import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/view/widget/app_dialog.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController(); //이메일 컨트롤러
  var pwController = TextEditingController(); //패스워드 컨트롤러
  var pwConfirmController = TextEditingController(); //패스워드 확인 컨트롤러
  var nickNameController = TextEditingController(); //닉네임 컨트롤러

  Rxn<String> emailError = Rxn<String>(); //이메일 에러 메세지
  Rxn<String> pwError = Rxn<String>(); //패스워드 에러 메세지
  Rxn<String> pwConfirmError = Rxn<String>(); //패스워드 확인 에러 메세지
  Rxn<String> nickNameError = Rxn<String>(); //닉네임 에러 메세지

  RxBool isButtonActivated = false.obs; //회원가입 버튼 활성화 여부

  //회원가입
  signup() async {
    if (await Get.find<AuthController>().signup(
        emailController.text, pwController.text, nickNameController.text)) {
      Get.back();
      Get.dialog(
        AppDialog(
          content: '회원가입에 성공했습니다.',
          cancelText: '닫기',
          confirmText: '확인',
          onCancel: () => Get.back(),
          onConfirm: () => Get.back(),
        ),
      );
    } else {
      Get.dialog(
        AppDialog(
          content: '회원가입에 실패했습니다.',
          cancelText: '닫기',
          confirmText: '확인',
          onCancel: () => Get.back(),
          onConfirm: () => Get.back(),
        ),
      );
    }
  }

  //이메일 형식 체크
  checkEmailValidation(String value) {
    if (value.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      emailError('이메일 형식이 맞지 않습니다.');
    } else {
      emailError.value = null;
    }
    activeSignupButton();
  }

  //비밀번호 형식 체크
  checkPasswordValidation(String value) {
    if (value.isNotEmpty &&
        !RegExp(r'''^((?=.*\d{1})(?=.*[a-zA-Z]{1}))+[a-zA-Z0-9]{8,20}$''')
            .hasMatch(value)) {
      pwError('8자리 이상 20자리 이하의 영문 숫자 혼합이어야 합니다.');
    } else {
      pwError.value = null;
    }
    activeSignupButton();
  }

  //비밀번호 확인 형식 체크
  checkPasswordConfirmValidation(String value) {
    if (value.isNotEmpty && value != pwController.text) {
      pwConfirmError('비밀번호가 일치하지 않습니다.');
    } else {
      pwConfirmError.value = null;
    }
    activeSignupButton();
  }

  //닉네임 형식 체크
  checkNickNameValidation(String value) {
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<> ]'))) {
      nickNameError('특수문자와 공백은 포함될 수 없습니다.');
    } else {
      nickNameError.value = null;
    }
    activeSignupButton();
  }

  //회원가입 버튼 활성화
  activeSignupButton() {
    if (emailController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        pwConfirmController.text.isNotEmpty &&
        nickNameController.text.isNotEmpty &&
        emailError.value == null &&
        pwError.value == null &&
        pwConfirmError.value == null &&
        nickNameError.value == null) {
      isButtonActivated.value = true;
    } else {
      isButtonActivated.value = false;
    }
  }
}
