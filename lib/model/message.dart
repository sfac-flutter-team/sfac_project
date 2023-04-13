// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sfac_project/model/myInfo.dart';

class Message {
  
  String content;
  DateTime sendDate;
  MyInfo myInfo;
  Message({
    
    required this.content,
    required this.sendDate,
    required this.myInfo,
  });



  // factory Message.fromMap({
  //   required String id,
  //   required Map<String,dynamic>map
  // }){
  //   return Message(
  //     id: id,
  //     content: map['content']??'',
  //     sendDate: map['sendDate']??Timestamp(0, 0)
  //   );
  // }

  // Map<String,dynamic> toMap(){
  //   Map<String,dynamic> data = {};
  //   data['content']=content;
  //   data['sendDate']=sendDate;
  //   return data;
  // }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'content': content,
      'sendDate': sendDate.millisecondsSinceEpoch,
      'myInfo': myInfo.toMap(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      
      content: map['content'] as String,
      sendDate: DateTime.fromMillisecondsSinceEpoch(map['sendDate'] as int),
      myInfo: MyInfo.fromMap(map['myInfo'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
