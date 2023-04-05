import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/myInfo.dart';


import '../../controller/my_info_controller.dart';

class MyInfoScreen extends GetView<MyInfoController> {
  const MyInfoScreen({super.key});
  static const route = '/myInfo';
  
 
  @override
  Widget build(BuildContext context) {
    var teamId = controller.getData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: controller.openBottomSheet,
                child: Obx(()=>
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: controller.user!.photoURL != null ? NetworkImage(controller.user!.photoURL!) : null,
                  ),
                ),
              ),
              Text(controller.user!.displayName!),
              Text(controller.user!.email!),
              //controller.getCard(),
              ListTile(
                leading: CircleAvatar(),
                title: Text("팀을 선택해주세요"),
                trailing: TextButton(onPressed: controller.choiceTeam, child: Text("선택")),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
  // Stream<List<MyInfo>> streamInfo(){
  //   try{
  //     //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
  //     final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance.collection('myInfo/${controller.user!.uid}/teamId').snapshots();
  //     return snapshots.map((querySnapshot){
  //       List<MyInfo> messages = [];//querySnapshot을 message로 옮기기 위해 List<MessageModel> 선언
  //       querySnapshot.docs.forEach((element) { //해당 컬렉션에 존재하는 모든 docs를 순회하며 messages 에 데이터를 추가한다.
  //          messages.add(
  //             MyInfo.fromMap(
  //                 map:element.data() as Map<String, dynamic>
  //             )
  //          );
  //       });
  //       return messages; //QuerySnapshot에서 List<MessageModel> 로 변경이 됐으니 반환
  //     }); //Stream<QuerySnapshot> 에서 Stream<List<MessageModel>>로 변경되어 반환됨

  //   }catch(ex){//오류 발생 처리
    
  //     return Stream.error(ex.toString());
  //   }
  // }
}