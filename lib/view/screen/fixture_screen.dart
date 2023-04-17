import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/fixture_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/fixture_card.dart';
import 'package:sfac_project/view/widget/schedule_card.dart';

class FixtureScreen extends GetView<FixtureController> {
  const FixtureScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(27, 52, 46, 42),
            child: Row(
              children: [
                Image.asset(
                  width: 62,
                  'assets/images/app_logo_white.png',
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () => controller.selectDate(context),
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          style: AppTextStyle.hKorPreSemiBold24(
                              color: AppColor.white),
                          DateFormat('yyyy.M.d')
                              .format(controller.selectedDate.value),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        width: 24,
                        'assets/icons/calendar.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const AppProgressIndicator();
          } else {
            if (controller.currentFixtures.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.currentFixtures.length,
                  itemBuilder: (context, index) {
                    var fixture = controller.currentFixtures[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0 ||
                              fixture.date !=
                                  controller.currentFixtures[index - 1].date)
                            Column(
                              children: [
                                Text(
                                  style: AppTextStyle.hKorPreSemiBold14(),
                                  DateFormat('H:mm').format(fixture.date),
                                ),
                                const SizedBox(height: 9),
                              ],
                            ),
                          if (fixture.homeGoals != null)
                            FixtureCard(
                              fixture: fixture,
                              onTap: () => Get.toNamed(AppRoutes.lineup,
                                  arguments: fixture.id),
                            )
                          else
                            ScheduleCard(
                              fixture: fixture,
                              onTap: () => Get.toNamed(AppRoutes.lineup,
                                  arguments: fixture.id),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    style:
                        AppTextStyle.bKorPreRegular20(color: AppColor.mainBlue),
                    '오늘은 경기가 없습니다.',
                  ),
                ),
              );
            }
          }
        }),
      ],
    );
  }
}
