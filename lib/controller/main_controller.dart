import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;

  logout() => Get.find<AuthController>().logout();

  handleNavigationOnTap(int index) {
    selectedIndex(index);
    pageController.jumpToPage(selectedIndex.value);
  }
}
