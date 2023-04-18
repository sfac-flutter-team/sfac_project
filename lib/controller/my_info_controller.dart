import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/service/storage_service.dart';
import 'package:sfac_project/util/app_color.dart';
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
    Get.bottomSheet(Column(
      children: [
        TextButton(onPressed: gallery, child: Text("갤러리에서 선택")),
        TextButton(onPressed: camera, child: Text("사진찍기")),
      ],
    ));
  }

Future<QuerySnapshot<Map<String, dynamic>>> readTeams() {
  final teamRef = FirebaseFirestore.instance.collection('teams');
  return teamRef.get();
}

void choiceTeam() async {
  final snapshot = await readTeams();
  final teamList = snapshot.docs.map((doc) => doc.data()).toList();
  Get.bottomSheet(
    SingleChildScrollView(
      child: Column(
        children: teamList.map((data) {
          final team = Team.fromMap(data['team']);
          return TextButton(
            onPressed: () => updateTeamId(team.id),
            child: Text(team.name),
          );
        }).toList(),
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
