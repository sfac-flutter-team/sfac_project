import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/controller/find_password_controller.dart';
import 'package:sfac_project/controller/login_controller.dart';
import 'package:sfac_project/controller/main_controller.dart';
import 'package:sfac_project/controller/market_controller.dart';
import 'package:sfac_project/controller/product_controller.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/firebase_options.dart';
import 'package:sfac_project/util/app_pages.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/controller/signup_controller.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //우측 상단 DEBUG리본 없애기
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignupController(), fenix: true);
        Get.lazyPut(() => FindPasswordController(), fenix: true);
        Get.lazyPut(() => MainController(), fenix: true);
        Get.lazyPut(() => MarketController(), fenix: true);
        Get.lazyPut(() => ProductController(), fenix: true);
        Get.lazyPut(() => ShoppingBasketController(), fenix: true);
      }),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
    );
  }
}
