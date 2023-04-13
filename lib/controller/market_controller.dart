import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/shoppingbasket.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketController extends GetxController {
  get shoppingList => Get.find<ShoppingBasketController>().shoppingBasket;

  RxList<QueryDocumentSnapshot<Product>> productList =
      RxList<QueryDocumentSnapshot<Product>>();

// 상품 가져오기
  readProduct() async {
    productList(await DBService().readProduct());
  }

  @override
  void onInit() {
    super.onInit();
    readProduct();
  }
}
