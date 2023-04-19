import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_routes.dart';
import 'package:sfac_project/util/app_text_style.dart';

import '../../controller/my_info_controller.dart';

class MyInfoScreen extends GetView<MyInfoController> {
  const MyInfoScreen({super.key});
  static const route = '/myInfo';

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: AppColor.lineargradient,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              height: MediaQuery.of(context).size.height / 7 * 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(controller.user.value.displayName!,
                                    style: AppTextStyle.hKorPreSemiBold28(
                                        color: AppColor.white)),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.white.withOpacity(0.3)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                    child: Text(
                                      controller.user.value.email!,
                                      style: AppTextStyle.hKorPreSemiBold14(
                                          color: AppColor.darkWhite),
                                    ),
                                  )),
                            ],
                          ),
                          Stack(children: [
                            Obx(
                              () => CircleAvatar(
                                radius: 55,
                                backgroundColor: AppColor.white,
                                backgroundImage: controller.profileUrl.value !=
                                        null
                                    ? NetworkImage(controller.profileUrl.value!)
                                    : null,
                                child: controller.profileUrl.value == null
                                    ? Image.asset(
                                        width: 60,
                                        'assets/icons/circle-user.png')
                                    : null,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: controller.openBottomSheet,
                                child: Badge(
                                  largeSize: 30,
                                  backgroundColor: AppColor.white,
                                  label: Image.asset('assets/icons/pen.png'),
                                ),
                              ),
                            )
                          ]),
                        ]),

                    //내 댓글, 구매내역, 로그아웃
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed(AppRoutes.myComments,
                              arguments: [controller.teamInfo]),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                        'assets/icons/message.png',
                                        color: AppColor.mainDarkBlue,
                                        width: 20,
                                        height: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(AppRoutes.purchasehistory),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Image.asset('assets/icons/bag.png',
                                        color: AppColor.mainDarkBlue,
                                        width: 20,
                                        height: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: controller.logout,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: AppColor.white.withOpacity(0.3)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("로그아웃",
                                      style: AppTextStyle.hKorPreSemiBold15(
                                          color: AppColor.white)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                        'assets/icons/logout.png',
                                        color: AppColor.mainDarkBlue,
                                        width: 20,
                                        height: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 25,
          right: 25,
          child: Obx(() {
            if (controller.teamInfo.value?.data().name == null) {
              return Container(
                height: 110,
                width: 370,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.mainDarkBlue.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 6,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.mainBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        fit: BoxFit.contain,
                        'assets/images/app_logo_white.png',
                      ),
                    ),
                    title: const Text('팀을 선택해주세요',
                        style: AppTextStyle.bKorPreRegular16),
                    trailing: TextButton(
                        onPressed: controller.choiceTeam,
                        child: const Text("선택",
                            style: AppTextStyle.bKorPreRegular16)),
                  ),
                ),
              );
            } else {
              return Container(
                height: 110,
                width: 370,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.mainDarkBlue.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 6,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 24, 0, 16),
                  child: ListTile(
                    leading: ClipRRect(
                      child:
                          Image.network(controller.teamInfo.value!.data().logo),
                    ),
                    title: Text(controller.teamInfo.value!.data().name,
                        style: AppTextStyle.bKorPreRegular16),
                    trailing: TextButton(
                        onPressed: controller.choiceTeam,
                        child: const Text(
                          "선택",
                          style: AppTextStyle.bKorPreRegular16,
                        )),
                  ),
                ),
              );
            }
          }),
        )
      ]),
    ]);
  }
}
