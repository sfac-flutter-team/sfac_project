import 'package:get/get.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/view/page/find_password_page.dart';
import 'package:sfac_project/view/page/login_page.dart';
import 'package:sfac_project/view/page/main_page.dart';
import 'package:sfac_project/view/page/product_page.dart';
import 'package:sfac_project/view/page/shopping_basket_page.dart';
import 'package:sfac_project/view/page/signup_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage()), //로그인
    GetPage(name: AppRoutes.main, page: () => const MainPage()), //메인
    GetPage(name: AppRoutes.signup, page: () => const SignupPage()), //회원가입
    GetPage(
        name: AppRoutes.findPassword,
        page: () => const FindPasswordPage()), //비밀번호 찾기
    GetPage(name: AppRoutes.product, page: () => const ProductPage()), // 상품 디테일
    GetPage(
        name: AppRoutes.shoppingbasket,
        page: () => const ShoppingBasketPage()), //장바구니
  ];
}
