import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/my_team_controller.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_progress_indicator.dart';
import 'package:sfac_project/view/widget/app_text_button.dart';
import 'package:sfac_project/view/widget/fixture_card.dart';
import 'package:sfac_project/view/widget/schedule_card.dart';

class MyTeamScreen extends GetView<MyTeamController> {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: AppProgressIndicator());
      } else {
        if (controller.myInfo!.teamId != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: AppColor.lineargradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(60),
                      child: Text(
                        style: AppTextStyle.hKorPreSemiBold20(
                          color: AppColor.white,
                        ),
                        '내 팀',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -70,
                    child: Image.network(
                      height: 140,
                      controller.teamInfo.value!.data().logo,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              style: AppTextStyle.hKorPreSemiBold16(),
                              '내 팀 순위',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              style: AppTextStyle.hKorPreSemiBold16(
                                  color: AppColor.mainBlue),
                              controller.teamRank.value!.data().rank.toString(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 10.0),
                            child: Row(
                              children: [
                                const Text(
                                  style: AppTextStyle.bKorPreRegular16,
                                  '경기 수',
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  style: AppTextStyle.hKorPreSemiBold16(),
                                  controller.teamRank.value!
                                      .data()
                                      .played
                                      .toString(),
                                ),
                                const SizedBox(width: 40),
                                const Text(
                                  style: AppTextStyle.bKorPreRegular16,
                                  '승점',
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  style: AppTextStyle.hKorPreSemiBold16(),
                                  controller.teamRank.value!
                                      .data()
                                      .points
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 34),
                        Row(
                          children: [
                            Text(
                              style: AppTextStyle.hKorPreSemiBold16(),
                              '내 팀 결과',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              style: AppTextStyle.bKorPreRegular14(),
                              '가장 최근 결과를 보여줍니다.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          style: AppTextStyle.hKorPreSemiBold16(
                              color: AppColor.mainBlue),
                          DateFormat('yyyy.M.d. E', 'ko')
                              .format(controller.teamResult.value!.date),
                        ),
                        const SizedBox(height: 8),
                        FixtureCard(
                          fixture: controller.teamResult.value!,
                          onTap: () => Get.toNamed(AppRoutes.lineup,
                              arguments: controller.teamResult.value!.id),
                        ),
                        const SizedBox(height: 26),
                        Row(
                          children: [
                            Text(
                              style: AppTextStyle.hKorPreSemiBold16(),
                              '내 팀 일정',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              style: AppTextStyle.bKorPreRegular14(),
                              '바로 다음 경기 일정을 보여줍니다.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          style: AppTextStyle.bKorPreRegular16,
                          DateFormat('yyyy.M.d. E', 'ko')
                              .format(controller.teamSchedule.value!.date),
                        ),
                        const SizedBox(height: 8),
                        ScheduleCard(
                          fixture: controller.teamSchedule.value!,
                          onTap: () => Get.toNamed(AppRoutes.lineup,
                              arguments: controller.teamSchedule.value!.id),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: SizedBox(),
                            ),
                            AppTextButton(
                              onPressed: () => Get.toNamed(AppRoutes.comment,
                                  arguments: [
                                    controller.teamInfo,
                                    controller.myInfo
                                  ]),
                              buttonColor: AppColor.mainBlue,
                              childText: '응원하기',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 62, horizontal: 20),
                child: Image.asset(
                  width: 46,
                  'assets/images/app_logo.png',
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.bKorPreRegular20(color: AppColor.mainBlue),
                    'MY 페이지에서\n응원하는 팀을 선택해 주세요',
                  ),
                ),
              ),
            ],
          );
        }
      }
    });
  }
}
