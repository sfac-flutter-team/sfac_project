import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/service/auth_service.dart';
import 'package:sfac_project/util/app_routes.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  var pwFindController = TextEditingController();
  User? get user => _user.value;

  login(id, pw) => AuthService().login(id, pw);

  logout() => AuthService().logout();

  //Firebase에 유저값이 있으면 메인페이지로 이동, 아니면 로그인페이지
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      _user(value);
      if (value != null) {
        //Get.offAllNamed은 이전 페이지 모두 삭제 후 이동
        Get.offAllNamed(AppRoutes.main);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }
  Future<void> resetPassword(String email) async{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  Get.snackbar("비밀번호 재인증", "메일을 성공적으로 보냈습니다");
  Get.toNamed("/login");
 }
}
