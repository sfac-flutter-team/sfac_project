import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/my_info_controller.dart';
import 'package:sfac_project/model/fixture.dart';

import '../model/standing.dart';
import '../model/team.dart';
import '../service/db_service.dart';
import 'auth_controller.dart';

class MyTeamController extends GetxController {
  Rx<User> get user => Get.find<AuthController>().user!.obs;
  var db = FirebaseFirestore.instance;
  Rxn<QueryDocumentSnapshot<Team>> teamInfo =
      Rxn<QueryDocumentSnapshot<Team>>();
  int? team;
  Rxn<QueryDocumentSnapshot<Standing>> teamRank =
      Rxn<QueryDocumentSnapshot<Standing>>();
  Rxn<Fixture> teamResult = Rxn<Fixture>();
  Rxn<Fixture> teamSchedule = Rxn<Fixture>();

  getData() async {
    var result = await db.collection("userInfo").doc(user.value.uid).get();
    print(result.data()!['teamId']);
    team = result.data()!['teamId'];
    teamInfo.value = await DBService().getTeamWithId(team!) ?? "null";
  }

  getUpadateTeam() async {
    var docRef = db.collection('userInfo').doc(user.value.uid);
    docRef.snapshots().listen((event) async {
      team = event.data()!['teamId'];
      teamInfo.value = await DBService().getTeamWithId(team!) ?? 'null';
      print(teamInfo.value!.data().name);
      getRank();
      getTeamResult();
      getNextSchedule();
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
    getUpadateTeam();
  }

  getRank() async {
    teamRank.value = await DBService().getStandingWithId(team!) ?? 'null';
    print(teamRank.value!.data().rank);
  }

  getTeamResult() async {
    teamResult.value =
        await DBService().getLastFixturesWithTeamId(team!) ?? 'null';
    print(teamResult.value!.home.name + '상대정보');
  }

  getNextSchedule() async {
    teamSchedule.value =
        await DBService().getNextScheduleWithTeamId(team!) ?? 'null';
    print(teamSchedule.value!.home.name + '다음스케줄');
  }
}
