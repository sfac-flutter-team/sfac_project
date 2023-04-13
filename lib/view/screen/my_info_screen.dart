import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_bottom_sheets.dart';

import '../../controller/my_info_controller.dart';

class MyInfoScreen extends GetView<MyInfoController> {
  const MyInfoScreen({super.key});
  static const route = '/myInfo';

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, 
    children: [
      
      Stack(
      children: [
        Column(
        children:[Container(
          decoration: const BoxDecoration(
              gradient: AppColor.lineargradient,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          height: 450,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 80, 8, 24),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.user.value.displayName!,
                            style: AppTextStyle.hKorPreSemiBold28(color: AppColor.white)),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.white.withOpacity(0.3)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.user.value.email!,
                                style: AppTextStyle.bKorPreRegular14(
                                    color: AppColor.darkWhite),
                              ),
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: controller.openBottomSheet,
                      child: Obx(
                        () => CircleAvatar(
                          radius: 55,
                          backgroundImage: controller.profileUrl.value != null
                              ? NetworkImage(controller.profileUrl.value!)
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                //내 댓글, 구매내역, 로그아웃
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColor.white.withOpacity(0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("내 댓글",
                                style: AppTextStyle.hKorPreSemiBold18(
                                    color: AppColor.darkWhite)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/icons/message.png',
                                  color: AppColor.mainDarkBlue, width: 20, height: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColor.white.withOpacity(0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("구매내역",
                                style: AppTextStyle.hKorPreSemiBold18(
                                    color: AppColor.darkWhite)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/icons/bag.png',
                                  color: AppColor.mainDarkBlue, width: 20, height: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColor.white.withOpacity(0.3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("로그아웃",
                                style: AppTextStyle.hKorPreSemiBold18(
                                    color: AppColor.darkWhite)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/icons/logout.png',
                                  color: AppColor.mainDarkBlue, width: 20, height: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 80),
        ],),
        Positioned(
          bottom: 0,
          right: 27,
          child: Obx(() {
            if (controller.teamInfo.value?.data().name == null) {
              return Container(
                height: 100,
                width: 370,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                      color: AppColor.mainDarkBlue.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                    )]
                    ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,24,0,16),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                    ),
                    title: Text('팀을선택해주세요', style: AppTextStyle.bKorPreRegular20),
                    trailing: TextButton(
                        onPressed: controller.choiceTeam, child: const Text("선택", style: AppTextStyle.bKorPreRegular20)),
                  ),
                ),
              );
            } else {
              return Container(
                height: 100,
                width: 370,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                      color: AppColor.mainDarkBlue.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                    )]
                    ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,24,0,16),
                  child: ListTile(
                    leading: ClipRRect(
                      child: Image.network(controller.teamInfo.value!.data().logo),
                    ),
                    title: Text(controller.teamInfo.value!.data().name, style: AppTextStyle.bKorPreRegular20),
                    trailing: TextButton(
                        onPressed: controller.choiceTeam, child: const Text("선택", style: AppTextStyle.bKorPreRegular20,)),
                  ),
                ),
              );
            }
          }),
          
        )
      ]),
      
      SizedBox(
        height: 200,
      ),
      TextButton(onPressed: controller.logout, child: Text('로그아웃')),
    ]);
  }
}
