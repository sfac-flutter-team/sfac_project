import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/main_controller.dart';
import 'package:sfac_project/view/screen/fixture_screen.dart';
import 'package:sfac_project/view/screen/market_screen.dart';
import 'package:sfac_project/view/screen/my_info_screen.dart';
import 'package:sfac_project/view/screen/my_team_screen.dart';
import 'package:sfac_project/view/screen/ranking_screen.dart';
import 'package:sfac_project/view/widget/app_navigation_bar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MyTeamScreen(),
          RankingScreen(),
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
