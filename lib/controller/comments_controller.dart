import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/team.dart';
import '../service/db_service.dart';
import 'auth_controller.dart';

class CommentsController extends GetxController{
   Rx<User> get user => Get.find<AuthController>().user!.obs;
   var db = FirebaseFirestore.instance;
   Rxn<QueryDocumentSnapshot<Team>> teamInfo = Rxn<QueryDocumentSnapshot<Team>>();
   int? team;

   getData() async{
    var result = await db.collection("userInfo").doc(user.value.uid).get();
    print(result.data()!['teamId']);
      team = result.data()!['teamId'];
     teamInfo.value = await DBService().getTeamWithId(team!)?? "null";
  }

  @override
   void onInit() async{
    super.onInit();
    await getData();
   }
}