import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/service/storage_service.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';
import 'package:sfac_project/view/widget/app_bottom_sheets.dart';

import '../model/team.dart';
import '../service/db_service.dart';

class MyInfoController extends GetxController {
  Rx<User> get user => Get.find<AuthController>().user!.obs;
  var db = FirebaseFirestore.instance;
  Rxn<QueryDocumentSnapshot<Team>> teamInfo =
      Rxn<QueryDocumentSnapshot<Team>>();
  Rxn<String> profileUrl =
      Rxn<String>(Get.find<AuthController>().user!.photoURL);

  Future<int> getData() async {
    var userInfo = await DBService().getUserInfo(user.value.uid);
    var teamId = userInfo['teamId'];
    teamInfo.value = await DBService().getTeamWithId(teamId);
    return teamId;
  }

  Future<void> updateTeamId(int teamId) async {
    await DBService().updateUserInfoTeamId(user.value.uid, teamId);
    await getData();
    Get.back();
  }

  logout() => Get.find<AuthController>().logout();

  gallery() async {
    var storageService = StorageService();
    var url = await storageService.gallery();
    profileUrl.value = url.value;
    Get.back();
  }

  camera() async {
    var storageService = StorageService();
    var url = await storageService.camera();
    profileUrl.value = url.value;
    Get.back();
  }

  void openBottomSheet() {
    Get.bottomSheet(Container(
      height: 230,
      padding: const EdgeInsets.all(26),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: gallery,
              child: const Text(
                "앨범에서 사진 선택",
                style: AppTextStyle.bKorPreRegular18,
              )),
          TextButton(
              onPressed: camera,
              child: const Text(
                "사진찍기",
                style: AppTextStyle.bKorPreRegular18,
              )),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('취소하기')),
          )
        ],
      ),
    ));
  }

  void choiceTeam() async {
    final snapshot = await DBService().readTeams();
    final teamList = snapshot.map((doc) => doc.data()).toList();
    Get.bottomSheet(
      AppBottomSheet(
        height: 300,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.from(teamList.map((team) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () => updateTeamId(team.id),
                    child: Row(
                      children: [
                        Image.network(
                            width: 35, height: 35, team.logo.toString()),
                        const SizedBox(width: 15),
                        Text(
                          style: AppTextStyle.bKorPreRegular16,
                          team.name.toString(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
