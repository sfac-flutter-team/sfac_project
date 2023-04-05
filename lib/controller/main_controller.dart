import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/service/db_service.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  RxList<QueryDocumentSnapshot<Product>> productList =
      RxList<QueryDocumentSnapshot<Product>>();

// 상품 가져오기
  readProduct() async {
    var url = productList(await DBService().readProduct());
    // print(productList.forEach(() {}));
    // productList.forEach((e) => print(e.data()));
  }

  logout() => Get.find<AuthController>().logout();

  handleNavigationOnTap(int index) {
    selectedIndex(index);
    pageController.jumpToPage(selectedIndex.value);
  }

  @override
  void onInit() {
    super.onInit();
    readProduct();
  }
}
