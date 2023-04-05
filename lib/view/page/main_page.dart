import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';

import '../../util/app_routes.dart';

class MainPage extends GetView<AuthController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('메인페이지'),
            Text(controller.user!.displayName!),
            TextButton(
              onPressed: controller.logout,
              child: const Text('로그아웃'),
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.myInfo),
              child: const Text('내 정보 페이지 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
