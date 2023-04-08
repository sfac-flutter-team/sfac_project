import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/main_controller.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/view/screen/fixture_screen.dart';
import 'package:sfac_project/view/screen/market_screen.dart';
import 'package:sfac_project/view/screen/my_info_screen.dart';
import 'package:sfac_project/view/widget/app_navigation_bar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('페이지 1'),
                const Text('여러분 페이지 이동은 했는데 각자 만드는 페이지 연결은 해주세요'),
                TextButton(
                  onPressed: () => DBService().getNextScheduleWithTeamId(33),
                  child: const Text('로그아웃'),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('페이지 2'),
                const Text('여러분 페이지 이동은 했는데 각자 만드는 페이지 연결은 해주세요'),
                TextButton(
                  onPressed: controller.logout,
                  child: const Text('로그아웃'),
                ),
              ],
            ),
          ),
          FixtureScreen(),
          MarketScreen(),
          MyInfoScreen(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => AppNavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onTap: (index) => controller.handleNavigationOnTap(index),
        ),
      ),
    );
  }
}
