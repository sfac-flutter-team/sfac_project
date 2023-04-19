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

class AppRoutes {
  static const login = LoginPage.route; //로그인
  static const main = MainPage.route; //메인 페이지
  static const signup = SignupPage.route; //회원가입
  static const findPassword = FindPasswordPage.route; //비밀번호 찾기
  static const lineup = LineupPage.route; //라인업 페이지
  static const comment = CommentsPage.route; //응원 댓글 페이지
  static const product = ProductPage.route; // 상품 디테일
  static const shoppingbasket = ShoppingBasketPage.route; //장바구니
  static const buyerinfo = BuyerInfoPage.route; //구매자 정보 입력 페이지
  static const calculate = CalculatePage.route; //계산페이지
  static const purchasehistory = PurchaseHistoryPage.route; //구매내역페이지
  static const myComments = MyCommentsPage.route; //내 댓글 페이지
}
