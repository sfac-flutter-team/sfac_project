import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/service/db_service.dart';

class MarketController extends GetxController {
  RxList<QueryDocumentSnapshot<Product>> productList =
      RxList<QueryDocumentSnapshot<Product>>();

// 상품 가져오기
  readProduct() async {
    productList(await DBService().readProduct());
  }

  //상품 하나 가져오기
  // getProduct(String productId) async {
  //   productList(await DBService().getProduct(productId));
  // }

  @override
  void onInit() {
    super.onInit();
    readProduct();
    // getProduct();
  }
}
