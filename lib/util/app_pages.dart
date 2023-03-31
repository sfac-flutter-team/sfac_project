import 'package:get/get.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/view/page/signup_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.signup, page: () => const SignupPage()), //회원가입
  ];
}
