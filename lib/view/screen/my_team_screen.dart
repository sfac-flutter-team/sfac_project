import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/my_info_controller.dart';

import '../../controller/my_team_controller.dart';
import '../../model/team.dart';

class MyTeamScreen extends GetView<MyTeamController> {
  const MyTeamScreen({super.key});
  static const route = '/myTeam';

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(controller.user.value.displayName!),
          Text(controller.teamInfo.value!.data().name),
          Text(controller.team.toString())
          
        ],
      );
    
  }
}