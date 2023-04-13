import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message.dart';
import '../model/myInfo.dart';
import '../model/team.dart';
import '../service/db_service.dart';
import 'auth_controller.dart';

class CommentsController extends GetxController{
  Rxn<QueryDocumentSnapshot<Team>> teamInfo = Get.arguments[0];
  TextEditingController textEditingController = TextEditingController();
  MyInfo myInfo = Get.arguments[1];
  @override
   void onInit() async{
    super.onInit();
   }

   Stream<List<Message>> streamMessages(){
    try{
      //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
      final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance.collection('teams/${teamInfo.value!.data().id.toString()}/messages').orderBy('sendDate').snapshots();
      return snapshots.map((querySnapshot){
        List<Message> messages = [];
        querySnapshot.docs.forEach((element) {
           messages.add(
              Message.fromMap(
                  element.data() as Map<String,dynamic>
              )
           );
        });
        return messages; 
      }); 

    }catch(ex){//오류 발생 처리
     
      return Stream.error(ex.toString());
    }
  }

   void _onPressedSendButton(){
    try{
      Message messageModel = Message(content: textEditingController.text,sendDate: DateTime.now(),myInfo: myInfo);
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      //chatroom이 아니라 teams , 
      firestore.collection('teams/${teamInfo.value!.data().id.toString()}/messages').add(messageModel.toMap());
    }catch(ex){
    }
  }

  Widget getInputWidget() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 15),
                  labelText: "내용을 입력하세요..",
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10,),
            RawMaterialButton(
              onPressed: _onPressedSendButton, 
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