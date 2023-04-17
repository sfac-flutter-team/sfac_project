import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message.dart';
import '../model/team.dart';
import 'auth_controller.dart';

class MyCommentsController extends GetxController{
  Rxn<QueryDocumentSnapshot<Team>> teamInfo = Get.arguments[0];
  User user = Get.find<AuthController>().user!;
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot<Object?>>? result;
  
   void showDialog(BuildContext context, String commentId) {
    Get.dialog(
      AlertDialog(
        title: Text("삭제하시겠습니까?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("취소"),
          ),
          TextButton(
            onPressed: () {
              // TODO: 삭제 로직 구현
              deleteComment(commentId);
              Get.back();
            },
            child: Text("삭제"),
          ),
        ],
      ),
    );
  }

  void deleteComment(String commentId) async {
  var messageRef = firestoreInstance.collection('teams/${teamInfo.value!.data().id}/messages').doc(commentId);
  await messageRef.delete();
  // 삭제된 댓글을 리스트에서 제거
  result!.removeWhere((element) => element.id == commentId);
  update(); // 리스트 갱신
}

Stream<QuerySnapshot> getData() {
    var currentUserRef = firestoreInstance.collection("userInfo").doc(user.uid);
    return FirebaseFirestore.instance.collection('teams/${teamInfo.value!.data().id}/messages')
        .where('myInfo', isEqualTo: currentUserRef)
        .snapshots();
  }

 }
