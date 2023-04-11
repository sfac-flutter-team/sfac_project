import 'package:get/get.dart';
import 'package:sfac_project/model/shoppingbasket.dart';

class ShoppingBasketController extends GetxController {
  //장바구니 리스트
  RxList<ShoppingBasket> shoppingBasket = <ShoppingBasket>[].obs;
}
