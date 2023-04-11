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
import 'package:sfac_project/view/screen/ranking_screen.dart';

class PlayerRankingScreen extends GetView<RankingController> {
  const PlayerRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '개인순위표',
                style: AppTextStyle.hKorPreBold36,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(height: 80, width: double.infinity, child: Text('EPL 로고')),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('전체')),
                ElevatedButton(onPressed: () {}, child: Text('득점순위')),
                const SizedBox(
                  width: 120,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('득점'),
                    SizedBox(
                      width: 40,
                    ),
                    Text('도움')
                  ],
                ),
              ),
            ),
            
                Obx(() {
                return ListView.builder(
                    physics: ScrollPhysics(),
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
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ClipRRect(
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          child: Image.network(controller
                                              .playerInfo.value!
                                              .data()[index]
                                              .photo)),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                        controller.playerInfo.value!
                                            .data()[index]
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
                                          controller.playerInfo.value!
                                              .data()[index]
                                              .total
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.hKorPreSemiBold20),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                          controller.playerInfo.value!
                                              .data()[index]
                                              .assists
                                              .toString(),
                                          style: AppTextStyle.hKorPreSemiBold20),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      } else {
                        Text('로딩중');
                      }
                    });
              }),
           
          ],
        ),
      ]),
    );
  }
}
