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
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      var ref = FirebaseStorage.instance.ref('profile/${user.value.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      user.value.updatePhotoURL(downloadUrl);
      profileUrl(downloadUrl);
      DBService().updateUserInfoPhoto(user.value.uid, downloadUrl);
    }
    Get.back();
  }

  camera() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.camera);
    if (res != null) {
      var ref = FirebaseStorage.instance.ref('profile/${user.value.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      user.value.updatePhotoURL(downloadUrl);
      profileUrl(downloadUrl);
      DBService().updateUserInfoPhoto(user.value.uid, downloadUrl);
    }
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

  void choiceTeam() {
    Get.bottomSheet(SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 33}).onError(
                        (e, _) => print("Error writing document: $e"));
                getData();
                Get.back();
              },
              child: Text("맨체스터 유나이티드")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 34});
                getData();
                Get.back();
              },
              child: Text("뉴캐슬")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 35});
                getData();
                Get.back();
              },
              child: Text("본머스")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 36});
                getData();
                Get.back();
              },
              child: Text("풀럼")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 39});
                getData();
                Get.back();
              },
              child: Text("울버햄튼")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 40});
                getData();
                Get.back();
              },
              child: Text("리버풀")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 41});
                getData();
                Get.back();
              },
              child: Text("사우스햄튼")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 42});
                getData();
                Get.back();
              },
              child: Text("아스널")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 45});
                getData();
                Get.back();
              },
              child: Text("에버튼")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 46});
                getData();
                Get.back();
              },
              child: Text("레스터시티")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 47});
                getData();
                Get.back();
              },
              child: Text("토트넘")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 48});
                getData();
                Get.back();
              },
              child: Text("웨스트햄")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 49});
                getData();
                Get.back();
              },
              child: Text("첼시")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 50});
                getData();
                Get.back();
              },
              child: Text("맨체스터 시티")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 51});
                getData();
                Get.back();
              },
              child: Text("브라이튼")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 52});
                getData();
                Get.back();
              },
              child: Text("크리스탈 팰리스")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 55});
                getData();
                Get.back();
              },
              child: Text("브렌트포드")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 63});
                getData();
                Get.back();
              },
              child: Text("리즈")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 65});
                getData();
                Get.back();
              },
              child: Text("노팅엄 포레스트")),
          TextButton(
              onPressed: () async {
                await db
                    .collection("userInfo")
                    .doc(user.value.uid)
                    .update({"teamId": 66});
                getData();
                Get.back();
              },
              child: Text("아스톤빌라")),
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
