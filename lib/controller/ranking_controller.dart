import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/service/db_service.dart';

class RankingController extends GetxController {
RxList<QueryDocumentSnapshot<Standing>> standingInfo = RxList<QueryDocumentSnapshot<Standing>>();
Rxn<QueryDocumentSnapshot<dynamic>> playerInfo = Rxn<QueryDocumentSnapshot<dynamic>>();
final standingRef = FirebaseFirestore.instance
      .collection('standings')
      .withConverter(
          fromFirestore: (snapshot, _) => Standing.fromMap(snapshot.data()!),
          toFirestore: (standing, _) => {});

final playerRef = FirebaseFirestore.instance
      .collection('players')
      .withConverter(
          fromFirestore: (snapshot, _) => snapshot
              .data()!['topscorers']
              .map((value) => Player.fromMap(value))
              .toList(),
          toFirestore: (player, _) => {});

  Future readData()async{
    standingInfo.value = await DBService().readStandings();
    playerInfo.value = await DBService().readTopScorers();
  }

@override
  void onInit(){
    super.onInit();
    readData();
  }
PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
handleRankingOnPressed(int index) {
   selectedIndex(index);
  pageController.jumpToPage(selectedIndex.value);
  }



}
