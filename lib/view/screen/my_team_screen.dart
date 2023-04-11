import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/my_info_controller.dart';
import 'package:sfac_project/util/app_routes.dart';

import '../../controller/my_team_controller.dart';
import '../../model/team.dart';

class MyTeamScreen extends GetView<MyTeamController> {
  const MyTeamScreen({super.key});
  static const route = '/myTeam';

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(controller.user.value.displayName!),
             Obx(() {
                  if(controller.teamInfo.value?.data().name == null){
                    return Card(
                      child: ListTile(
                            leading: CircleAvatar(),
                            title: Text('팀을선택해주세요'),
                            
                          ),
                    );
                  }
                  else {
                    return Card(
                      child: ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(controller.teamInfo.value!.data().logo),backgroundColor: Colors.white,),
                          title: Text(controller.teamInfo.value!.data().name),
                          
                          ),
                    );
                  }
                }),
                Text("내 팀 순위"),
              Obx(() {
                if(controller.teamRank.value?.data().rank==null){
                  return Text("내 정보 페이지에서 팀을 선택해주세요");
                }else{
                  return Text(controller.teamRank.value!.data().rank.toString()+'등');
                }
              }
              ),
              Obx(() {
                if(controller.teamRank.value?.data().rank==null){
                  return Text("내 정보 페이지에서 팀을 선택해주세요");
                }else{
                  return Text(controller.teamRank.value!.data().played.toString()+' 경기    '+controller.teamRank.value!.data().points.toString()+' 점');
                }
              }),
              SizedBox(height: 15,),
              Obx(() {
                if(controller.teamResult.value == null){
                  return Text("내 정보 페이지에서 팀을 선택해주세요");
                }else {
                  return Card(
                    child: Column(
                      children: [
                        Text("홈팀"),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.white,backgroundImage: NetworkImage(controller.teamResult.value!.home.logo),),
                          title: Text(controller.teamResult.value!.home.name),
                          subtitle: Text(controller.teamResult.value!.homeGoals.toString()),
                        ),
                        Text("어웨이팀"),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.white,backgroundImage: NetworkImage(controller.teamResult.value!.away.logo),),
                          title: Text(controller.teamResult.value!.away.name),
                          subtitle: Text(controller.teamResult.value!.awayGoals.toString()),
                        ),
                      ],
                    ),
                  );
                }
              }),
              Text("다음경기 일정"),
              Obx(() {
                if(controller.teamSchedule.value == null){
                  return Text("내 정보 페이지에서 팀을 선택해주세요");
                }else {
                  return Card(
                    child: Column(
                      children: [
                        Text("홈"),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.white,backgroundImage: NetworkImage(controller.teamSchedule.value!.home.logo),),
                          title: Text(controller.teamSchedule.value!.home.name),
                          subtitle: Text(controller.teamSchedule.value!.status),
                        ),
                        Text("어웨이"),
                        ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.white,backgroundImage: NetworkImage(controller.teamSchedule.value!.away.logo),),
                          title: Text(controller.teamSchedule.value!.away.name),
                          subtitle: Text(controller.teamSchedule.value!.date.toString()),
                        ),
                      ],
                    ),
                  );
                }
              }),
            TextButton(onPressed: () => Get.toNamed(AppRoutes.comment), child: Text("응원하러가기"))
          ],
        ),
    );
    
  }
}