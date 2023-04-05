import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class MyInfo {
  final String teamId;

  MyInfo({
    this.teamId=''
  });

  factory MyInfo.fromMap({required Map<String,dynamic> map}){
    return MyInfo(
      teamId: map['teamId'] ?? '',
    );
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> data = {};
    data['teamId'] = teamId;
    return data;
  }
  
}
