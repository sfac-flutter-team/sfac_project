import 'package:sfac_project/view/page/find_password_page.dart';
import 'package:sfac_project/view/page/login_page.dart';
import 'package:sfac_project/view/page/main_page.dart';
import 'package:sfac_project/view/page/product_page.dart';
import 'package:sfac_project/view/page/shopping_basket_page.dart';
import 'package:sfac_project/view/page/signup_page.dart';

class AppRoutes {
  static const login = LoginPage.route; //로그인
  static const main = MainPage.route; //메인 페이지
  static const signup = SignupPage.route; //회원가입
  static const findPassword = FindPasswordPage.route; //비밀번호 찾기
  static const product = ProductPage.route; // 상품 디테일
  static const shoppingbasket = ShoppingBasketPage.route; //장바구니
}
