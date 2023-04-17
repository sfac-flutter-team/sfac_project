import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/controller/my_team_controller.dart';
import 'package:sfac_project/service/storage_service.dart';
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
    var result = await db.collection("userInfo").doc(user.value.uid).get();
    var team = result.data()!['teamId'];
    teamInfo.value = await DBService().getTeamWithId(team);
    return team;
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

  Future<void> updateTeamId(int teamId) async {
    await db
        .collection("userInfo")
        .doc(user.value.uid)
        .update({"teamId": teamId});
    getData();
    Get.back();
  }

  void choiceTeam() {
    Get.bottomSheet(SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            onPressed: () => updateTeamId(33),
            child: Text("맨체스터 유나이티드"),
          ),
          TextButton(
            onPressed: () => updateTeamId(34),
            child: Text("뉴캐슬"),
          ),
          TextButton(
            onPressed: () => updateTeamId(35),
            child: Text("본머스"),
          ),
          TextButton(
            onPressed: () => updateTeamId(36),
            child: Text("풀럼"),
          ),
          TextButton(
            onPressed: () => updateTeamId(39),
            child: Text("울버햄튼"),
          ),
          TextButton(
            onPressed: () => updateTeamId(40),
            child: Text("리버풀"),
          ),
          TextButton(
            onPressed: () => updateTeamId(41),
            child: Text("사우스햄튼"),
          ),
          TextButton(
            onPressed: () => updateTeamId(42),
            child: Text("아스널"),
          ),
          TextButton(
            onPressed: () => updateTeamId(45),
            child: Text("에버튼"),
          ),
          TextButton(
            onPressed: () => updateTeamId(46),
            child: Text("레스터시티"),
          ),
          TextButton(
            onPressed: () => updateTeamId(47),
            child: Text("토트넘"),
          ),
          TextButton(
            onPressed: () => updateTeamId(48),
            child: Text("웨스트햄"),
          ),
          TextButton(
            onPressed: () => updateTeamId(49),
            child: Text("첼시"),
          ),
          TextButton(
            onPressed: () => updateTeamId(50),
            child: Text("맨체스터시티"),
          ),
          TextButton(
            onPressed: () => updateTeamId(51),
            child: Text("브라이튼"),
          ),
          TextButton(
            onPressed: () => updateTeamId(52),
            child: Text("크리스탈 팰리스"),
          ),
          TextButton(
            onPressed: () => updateTeamId(55),
            child: Text("브렌트포드"),
          ),
          TextButton(
            onPressed: () => updateTeamId(63),
            child: Text("리즈"),
          ),
          TextButton(
            onPressed: () => updateTeamId(65),
            child: Text("노팅엄 포레스트"),
          ),
          TextButton(
            onPressed: () => updateTeamId(66),
            child: Text("아스톤빌라"),
          ),
        ],
      ),
    ));
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
