import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sfac_project/service/auth_service.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  User? get user => _user.value;

  //회원가입
  signup(id, pw, nickName) => AuthService().signup(id, pw, nickName);
}
