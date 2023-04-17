import 'package:get/get.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/view/page/buyer_info_page.dart';
import 'package:sfac_project/view/page/calculate_page.dart';
import 'package:sfac_project/view/page/comments_page.dart';
import 'package:sfac_project/view/page/find_password_page.dart';
import 'package:sfac_project/view/page/lineup_page.dart';
import 'package:sfac_project/view/page/login_page.dart';
import 'package:sfac_project/view/page/main_page.dart';
import 'package:sfac_project/view/page/my_comments_page.dart';
import 'package:sfac_project/view/page/product_page.dart';
import 'package:sfac_project/view/page/purchase_history_page.dart';
import 'package:sfac_project/view/page/shopping_basket_page.dart';
import 'package:sfac_project/view/page/signup_page.dart';
import 'package:sfac_project/view/screen/my_info_screen.dart';
import 'package:sfac_project/view/screen/my_team_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        transition: Transition.fadeIn), //로그인
    GetPage(
        name: AppRoutes.main,
        page: () => const MainPage(),
        transition: Transition.fadeIn), //메인
    GetPage(
        name: AppRoutes.signup,
        page: () => const SignupPage(),
        transition: Transition.fadeIn), //회원가입
    GetPage(
        name: AppRoutes.findPassword,
        page: () => const FindPasswordPage(),
        transition: Transition.fadeIn), //비밀번호 찾기
    GetPage(
        name: AppRoutes.lineup,
        page: () => const LineupPage(),
        transition: Transition.fadeIn), //라인업 페이지
    GetPage(
        name: AppRoutes.comment,
        page: () => const CommentsPage(),
        transition: Transition.fadeIn), // 응원 댓글 페이지
    GetPage(
        name: AppRoutes.product,
        page: () => ProductPage(product: Get.arguments),
        transition: Transition.fadeIn), // 상품 디테일
    GetPage(
        name: AppRoutes.shoppingbasket,
        page: () => const ShoppingBasketPage()), //장바구니
    GetPage(
        name: AppRoutes.buyerinfo,
        page: () => const BuyerInfoPage()), // 구매자 정보 입력
    GetPage(name: AppRoutes.calculate, page: () => const CalculatePage()), //계산
    GetPage(
        name: AppRoutes.purchasehistory,
        page: () => const PurchaseHistoryPage()),
    GetPage(name: AppRoutes.myComments, page: () => const MyCommentsPage()),
  ];
}
