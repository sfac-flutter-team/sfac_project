import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/model/message.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/model/team.dart';

class CommentsController extends GetxController {
  Rxn<QueryDocumentSnapshot<Team>> teamInfo = Get.arguments[0];
  TextEditingController textEditingController = TextEditingController();
  MyInfo myInfo = Get.arguments[1];
  FocusNode focusNode = FocusNode();
  User user = Get.find<AuthController>().user!;

  Stream<List<Message>> streamMessages() {
    try {
      //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference myCollection = firestore
          .collection('teams/${teamInfo.value!.data().id.toString()}/messages');
      return myCollection.snapshots().asyncMap((querySnapshot) async {
        final docs = querySnapshot.docs;
        final data = <Message>[];
        for (final doc in docs) {
          final docRef = doc.get('myInfo');
          final String content = doc.get('content');
          final int sendDate = doc.get('sendDate');
          final DocumentSnapshot refDocSnapshot = await docRef.get();
          final String name = refDocSnapshot.get('name') as String;
          final String? photoUrl = refDocSnapshot.get('photoUrl');
          data.add(Message(
              content: content,
              sendDate: DateTime.fromMillisecondsSinceEpoch(sendDate),
              myInfo: MyInfo(name: name, photoUrl: photoUrl)));
        }
        data.sort((a, b) => -a.sendDate.compareTo(b.sendDate));
        return data;
      });
    } catch (ex) {
      //오류 발생 처리

      return Stream.error(ex.toString());
    }
  }

  void onPressedSendButton() {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference myCollection = firestore
          .collection('teams/${teamInfo.value!.data().id.toString()}/messages');

      final DocumentReference docRef =
          firestore.collection('userInfo').doc(user.uid);

      Map<String, dynamic> data = {
        'content': textEditingController.text,
        'sendDate': DateTime.now().millisecondsSinceEpoch,
        'myInfo': docRef // Reference 추가
      };
      myCollection.add(data);
      textEditingController.clear();
      focusNode.unfocus();
    } catch (e) {
      print(e);
    }
  }
}
