import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sfac_project/service/auth_service.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  User? get user => _user.value;

  //로그인
  login(id, pw, isPersisted) => AuthService().login(id, pw);

  //로그아웃
  logout() => AuthService().logout();

  //회원가입
  signup(id, pw, nickName) => AuthService().signup(id, pw, nickName);

  //비밀번호 찾기
  resetPassword(email) => AuthService().resetPassword(email);

  //구글 계정
  signInWithGoogle() async {
    await AuthService().signInWithGoogle();
    DBService().createUserInfo(user!.uid, user!.displayName!, user!.photoURL);
  }

  //자동 로그인 확인
  checkAutoSigning() async {
    var prefs = await SharedPreferences.getInstance();
    var isAutoSigningOn = prefs.getBool('isAutoSigningOn') ?? true;
    if (!isAutoSigningOn) await logout();
  }

  @override
  void onInit() async {
    super.onInit();
    await checkAutoSigning();
    //Firebase에 유저값이 있으면 메인페이지로 이동, 아니면 로그인페이지
    FirebaseAuth.instance.authStateChanges().listen((value) async {
      _user(value);
      if (Get.currentRoute != AppRoutes.signup) {
        if (value != null) {
          //Get.offAllNamed은 이전 페이지 모두 삭제 후 이동
          await Get.offAllNamed(AppRoutes.main);
        } else {
          if (Get.currentRoute != AppRoutes.login) {
            await Get.offAllNamed(AppRoutes.login);
          }
        }
      }
    });
    FlutterNativeSplash.remove();
  }
}
