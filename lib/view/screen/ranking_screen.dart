import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/ranking_controller.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/model/team.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class RankingScreen extends GetView<RankingController> {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '순위표',
                style: AppTextStyle.hKorPreBold36,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('EPL 로고'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration:
                                const BoxDecoration(color: AppColor.mainBlue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('출전권 : 챔피언스리그'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration:
                                const BoxDecoration(color: Colors.orange),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('출전권 : 유로파리그'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(color: Colors.red),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('강등권 : 챔피언쉽'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // 페이지 이동 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () =>
                            controller.handleRankingOnPressed(0),child: Text('전체')),
                ElevatedButton(
                  onPressed: () =>
                            controller.handleRankingOnPressed(1), child: Text('득점순위')),
                const SizedBox(
                  width: 120,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //경기수, 승점
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('경기 수'),
                    SizedBox(
                      width: 30,
                    ),
                    Text('승점')
                  ],
                ),
              ),
            ),
            //전체 순위표
            SizedBox(
              height: 500,
              child: ListView.builder(
                 padding: EdgeInsets.zero,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.standingInfo.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Text(
                                      controller.standingInfo[index]
                                          .data()
                                          .rank
                                          .toString(),
                                      style: AppTextStyle.hKorPreSemiBold20,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ClipRRect(
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.network(controller
                                          .standingInfo[index]
                                          .data()
                                          .team
                                          .logo)),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    controller.standingInfo[index]
                                        .data()
                                        .team
                                        .name
                                        .toString(),
                                    style: AppTextStyle.hKorPreSemiBold20),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                      controller.standingInfo[index]
                                          .data()
                                          .played
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.hKorPreSemiBold20),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                      controller.standingInfo[index]
                                          .data()
                                          .points
                                          .toString(),
                                      style: AppTextStyle.hKorPreSemiBold20),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
            //개인 순위표
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('개인순위표',
                style: AppTextStyle.hKorPreBold36
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 80, width: double.infinity, child: Text('EPL 로고')),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () =>
                            controller.handleRankingOnPressed(0),
                    child: Text('전체')),
                ElevatedButton(onPressed: () =>
                            controller.handleRankingOnPressed(1), child: Text('득점순위')),
                const SizedBox(width: 120),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('득점'),
                    SizedBox(width: 40),
                    Text('도움')
                  ],
                ),
              ),
            ),
            Obx(() {
              return SizedBox(height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.playerInfo.value!.data().length,
                    itemBuilder: (context, index) {
                      if (controller.playerInfo.value != null) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Text(
                                          controller.standingInfo[index].data().rank.toString(),
                                          style: AppTextStyle.hKorPreSemiBold20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ClipRRect(
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image.network(controller.playerInfo.value!.data()[index].photo)),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                        controller.playerInfo.value!.data()[index].name.toString(),
                                        style: AppTextStyle.hKorPreSemiBold20),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          controller.playerInfo.value!.data()[index].total.toString(),
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyle.hKorPreSemiBold20),
                                     const SizedBox(width: 50),
                                      Text(
                                          controller.playerInfo.value!
                                              .data()[index]
                                              .assists
                                              .toString(),
                                          style:
                                              AppTextStyle.hKorPreSemiBold20),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      } else {
                        Text('로딩중');
                      }
                    }),
              );
            }),
          ],
        ),
      ]),
    );
  }
}
