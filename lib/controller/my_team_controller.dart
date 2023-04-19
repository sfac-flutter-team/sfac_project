import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/fixture.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/model/team.dart';
import 'package:sfac_project/service/db_service.dart';
import 'auth_controller.dart';

class MyTeamController extends GetxController {
  Rx<User> get user => Get.find<AuthController>().user!.obs;
  var db = FirebaseFirestore.instance;
  Rxn<QueryDocumentSnapshot<Team>> teamInfo =
      Rxn<QueryDocumentSnapshot<Team>>();
  MyInfo? myInfo;
  Rxn<QueryDocumentSnapshot<Standing>> teamRank =
      Rxn<QueryDocumentSnapshot<Standing>>();
  Rxn<Fixture> teamResult = Rxn<Fixture>();
  Rxn<Fixture> teamSchedule = Rxn<Fixture>();
  RxBool isLoading = false.obs;

  getData() async {
    isLoading(true);
    var docRef = db.collection("userInfo").doc(user.value.uid);
    var result = await docRef.get();
    myInfo = MyInfo.fromMap(result.data() as Map<String, dynamic>);
    if (myInfo!.teamId != null) {
      teamInfo.value = await DBService().getTeamWithId(myInfo!.teamId!);
      await getUpadateTeam();
    }
    onTeamIdChanged(docRef);
    isLoading(false);
  }

  onTeamIdChanged(docRef) async {
    docRef.snapshots().listen((event) async {
      myInfo = MyInfo.fromMap(event.data()!);
      if (myInfo!.teamId != null) {
        teamInfo.value = await getTeamWithId(myInfo!.teamId!);
        getUpadateTeam();
      }
    });
  }

  getUpadateTeam() async {
    await getRank();
    await getTeamResult();
    await getNextSchedule();
  }

  getTeamWithId(teamId) async => await DBService().getTeamWithId(teamId);

  getRank() async {
    teamRank.value = await DBService().getStandingWithId(myInfo!.teamId!);
  }

  getTeamResult() async {
    teamResult.value =
        await DBService().getLastFixturesWithTeamId(myInfo!.teamId!);
  }

  getNextSchedule() async {
    teamSchedule.value =
        await DBService().getNextScheduleWithTeamId(myInfo!.teamId!);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
