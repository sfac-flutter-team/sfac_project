import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/my_info_controller.dart';


import '../model/standing.dart';
import '../model/team.dart';
import '../service/db_service.dart';
import 'auth_controller.dart';

class MyTeamController extends GetxController{
  Rx<User> get user => Get.find<AuthController>().user!.obs;
   var db = FirebaseFirestore.instance;
   Rxn<QueryDocumentSnapshot<Team>> teamInfo = Rxn<QueryDocumentSnapshot<Team>>();
   var team;
   Rxn<QueryDocumentSnapshot<Standing>> teamRank = Rxn<QueryDocumentSnapshot<Standing>>();
  
   Future<int> getData() async{
    var docRef = db.collection('userInfo').doc(user.value.uid);
    docRef.snapshots().listen((event) async {
      team = event.data()!['teamId'];
      teamInfo.value = await DBService().getTeamWithId(team)??'null';
      print(teamInfo.value!.data().name);
    });
     return team;
  }

   @override
   void onInit(){
    super.onInit();
    getData();
    
   }

  //  Future<QueryDocumentSnapshot<Standing>> getRank() async{
  //   teamRank.value = await DBService().getStandingWithId(team)??'null';
  //   print(teamRank.value!.data().rank);
  //   return teamRank.value!;
  // }
  getRank() async{
    
  }
  
 
}