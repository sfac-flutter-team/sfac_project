import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfac_project/controller/auth_controller.dart';

class MyInfoController extends GetxController{
  
  User? get user => Get.find<AuthController>().user;
  var db = FirebaseFirestore.instance;
  
  gallery() async{
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if(res!=null){
      var ref = FirebaseStorage.instance.ref('profile/${user!.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      user!.updatePhotoURL(downloadUrl);
    }
    Get.back();
  }

  camera() async{
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.camera);
    if(res!=null){
      var ref = FirebaseStorage.instance.ref('profile/${user!.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      user!.updatePhotoURL(downloadUrl);
    }
    Get.back();
  }

  void openBottomSheet(){
    Get.bottomSheet(
      Column(
        children: [
          TextButton(onPressed: gallery, child: Text("갤러리에서 선택")),
          TextButton(onPressed: camera, child: Text("사진찍기")),
        ],
      )
    );
  }

  void choiceTeam(){
    Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          children: [
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"33"})..onError((e, _) => print("Error writing document: $e"));
              Get.back();
            }, child: Text("맨체스터 유나이티드")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"34"});
              Get.back();
            }, child: Text("뉴캐슬")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"35"});
              Get.back();
            }, child: Text("본머스")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"36"});
              Get.back();
            }, child: Text("풀럼")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"39"});
              Get.back();
            }, child: Text("울버햄튼")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"40"});
              Get.back();
            }, child: Text("리버풀")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"41"});
              Get.back();
            }, child: Text("사우스햄튼")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"42"});
              Get.back();
            }, child: Text("아스널")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"45"});
              Get.back();
            }, child: Text("에버튼")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"46"});
              Get.back();
            }, child: Text("레스터시티")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"47"});
              Get.back();
            }, child: Text("토트넘")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"48"});
              Get.back();
            }, child: Text("웨스트햄")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"49"});
              Get.back();
            }, child: Text("첼시")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"50"});
              Get.back();
            }, child: Text("맨체스터 시티")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"51"});
              Get.back();
            }, child: Text("브라이튼")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"52"});
              Get.back();
            }, child: Text("크리스탈 팰리스")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"55"});
              Get.back();
            }, child: Text("브렌트포드")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"63"});
              Get.back();
            }, child: Text("리즈")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"65"});
              Get.back();
            }, child: Text("노팅엄 포레스트")),
            TextButton(onPressed: (){
              db.collection("userInfo").doc(user!.uid).set({"teamId":"66"});
              Get.back();
            }, child: Text("아스톤빌라")),
          ],
        ),
      )
    );
  }
}