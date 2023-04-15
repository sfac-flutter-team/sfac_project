import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/lineup_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/lineup_list_view.dart';
import 'package:sfac_project/view/widget/lineup_team_card.dart';

class LineupPage extends GetView<LineupController> {
  const LineupPage({super.key});
  static const route = '/lineup';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: controller.homeTeamLineup.value == null
              ? AppColor.mainBlue
              : AppColor.white,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () => Get.back(),
          ),
          title: controller.homeTeamLineup.value == null
              ? Image.asset(
                  width: 46,
                  'assets/images/app_logo.png',
                )
              : const SizedBox(),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: AppProgressIndicator());
          } else {
            if (controller.homeTeamLineup.value != null) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: AppColor.lineargradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 98.0, 20.0, 27.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: LineupTeamCard(
                                lineup: controller.homeTeamLineup.value!),
                          ),
                          Expanded(
                            child: LineupTeamCard(
                                lineup: controller.awayTeamLineup.value!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: LineupListView(
                                lineup: controller.homeTeamLineup.value!,
                                lineupType: LineupType.home,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: LineupListView(
                                lineup: controller.awayTeamLineup.value!,
                                lineupType: LineupType.away,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyle.bKorPreRegular20(color: AppColor.mainBlue),
                  '아직 라인업이\n생성되지 않았습니다.',
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
