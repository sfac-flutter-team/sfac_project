import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/ranking_controller.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/player_rank_list.dart';
import 'package:sfac_project/view/widget/team_rank_list.dart';

class RankingScreen extends GetView<RankingController> {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => controller.handleRankingOnPressed(0),
                    child:
                        Text('팀 순위', style: AppTextStyle.hKorPreSemiBold17())),
                TextButton(
                    onPressed: () => controller.handleRankingOnPressed(1),
                    child:
                        Text('개인순위', style: AppTextStyle.hKorPreSemiBold17())),
              ],
            ),
            Expanded(
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3,
                          alignment: Alignment.centerLeft,
                          color: AppColor.subDarkGrey,
                          child: Container(
                            color: AppColor.mainBlue,
                            width: 210,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 65,
                                  width: 140,
                                  child: Image.asset('assets/images/epl.png')),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: const BoxDecoration(
                                              color: AppColor.mainBlue),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('출전권 : 챔피언스리그',
                                            style: AppTextStyle
                                                .bKorPreRegular14()),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: const BoxDecoration(
                                              color: Colors.orange),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('출전권 : 유로파리그',
                                            style: AppTextStyle
                                                .bKorPreRegular14()),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Colors.red),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('강등권 : 챔피언쉽',
                                          style:
                                              AppTextStyle.bKorPreRegular14()),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //경기수, 승점
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 8),
                          child: SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('순위',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('팀',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const Expanded(child: SizedBox()),
                                  Text('경기 수',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('승점',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 26,
                          endIndent: 26,
                          color: AppColor.subGrey,
                        ),
                        //전체 순위표
                        Expanded(
                          child: Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.standingInfo.length,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: AppColor.subGrey,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return TeamRankList(
                                      standing:
                                          controller.standingInfo[index].data(),
                                      rankColor: controller.getRankingColor(
                                          controller.standingInfo[index]
                                              .data()
                                              .rank),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        //개인 순위표
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3,
                          alignment: Alignment.centerRight,
                          color: AppColor.subDarkGrey,
                          child: Container(
                            color: AppColor.mainBlue,
                            width: 220,
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        const SizedBox(height: 36),
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 65,
                                  width: 140,
                                  child: Image.asset('assets/images/epl.png')),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [SizedBox(width: 145)],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 8),
                          child: SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('순위',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const SizedBox(width: 20),
                                  Text('선수',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const Expanded(child: SizedBox()),
                                  Text('득점',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text('도움',
                                      style: AppTextStyle.hKorPreSemiBold14()),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 26,
                          endIndent: 26,
                          color: AppColor.subGrey,
                        ),
                        Obx(() {
                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.playerInfo.value!
                                      .data()
                                      .length,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: AppColor.subGrey,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    if (controller.playerInfo.value != null) {
                                      return PlayerRankList(
                                          player: controller.playerInfo.value!
                                              .data()[index],
                                          rank: index + 1);
                                    }
                                    return const Text('로딩중');
                                  }),
                            ),
                          );
                        }),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
