import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';


import '../../controller/my_info_controller.dart';

class MyInfoScreen extends GetView<MyInfoController> {
  const MyInfoScreen({super.key});
  static const route = '/myInfo';
  
 
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(controller.user.value.displayName!),
          Text(controller.user.value.email!),
             GestureDetector(
                  onTap: controller.openBottomSheet,
                  child: Obx(()=>
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: controller.profileUrl.value != null ? NetworkImage(controller.profileUrl.value!) : null,
                    ),
                  ),
                ),
              Row(
                children: [
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.mainBlue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("내 댓글"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                    Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.mainBlue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("구매내역"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 30,),
                   Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.mainBlue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("로그아웃"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              Obx(() {
                if(controller.teamInfo.value?.data().name == null){
                  return Card(
                    child: ListTile(
                          leading: CircleAvatar(),
                          title: Text('팀을선택해주세요'),
                          trailing: TextButton(onPressed: controller.choiceTeam, child: Text("선택")),
                        ),
                  );
                }
                else {
                  return Card(
                    child: ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(controller.teamInfo.value!.data().logo),backgroundColor: Colors.white,),
                        title: Text(controller.teamInfo.value!.data().name),
                        trailing: TextButton(onPressed: controller.choiceTeam, child: Text("선택")),),
                  );
                }
              })
          ]
      );
  }
 
}