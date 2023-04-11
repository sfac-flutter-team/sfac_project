import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/team.dart';
import '../service/db_service.dart';
import 'auth_controller.dart';

class CommentsController extends GetxController{
  Rxn<QueryDocumentSnapshot<Team>> teamInfo = Get.arguments;
  

  @override
   void onInit() async{
    super.onInit();
    
   }
}