import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';

import '../model/message.dart';
import '../model/myInfo.dart';
import '../model/team.dart';

class CommentsController extends GetxController {
  Rxn<QueryDocumentSnapshot<Team>> teamInfo = Get.arguments[0];
  TextEditingController textEditingController = TextEditingController();
  MyInfo myInfo = Get.arguments[1];
  FocusNode focusNode = FocusNode();
  User user = Get.find<AuthController>().user!;

  @override
  void onInit() async {
    super.onInit();
  }

  Stream<List<Message>> streamMessages() {
    try {
      //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference myCollection = firestore
          .collection('teams/${teamInfo.value!.data().id.toString()}/messages');
      //final Stream<QuerySnapshot> snapshots = myCollection.snapshots();

      return myCollection.snapshots().asyncMap((querySnapshot) async {
        final docs = querySnapshot.docs;
        final data = <Message>[];
        for (final doc in docs) {
          final docRef = doc.get('myInfo');
          final String content = doc.get('content');
          final int sendDate = doc.get('sendDate');
          final DocumentSnapshot refDocSnapshot = await docRef.get();
          final String name = refDocSnapshot.get('name') as String;
          final String? photoUrl = refDocSnapshot.get('photoUrl') as String;
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

  Widget getInputWidget() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15),
                  labelText: "내용을 입력하세요..",
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RawMaterialButton(
              onPressed: onPressedSendButton,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }
}
