import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_color.dart';

import '../util/app_text_style.dart';

class RankingController extends GetxController {
  RxList<QueryDocumentSnapshot<Standing>> standingInfo =
      RxList<QueryDocumentSnapshot<Standing>>();
  Rxn<QueryDocumentSnapshot<dynamic>> playerInfo =
      Rxn<QueryDocumentSnapshot<dynamic>>();
  Future readData() async {
    standingInfo.value = await DBService().readStandings();
    playerInfo.value = await DBService().readTopScorers();
  }

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  PageController pageController = PageController();
  RxInt selectedIndex = 0.obs;
  handleRankingOnPressed(int index) {
    selectedIndex(index);
    pageController.jumpToPage(selectedIndex.value);
  }

  Color getRankingColor(int rank) {
    if (rank <= 4) {
      return AppColor.mainBlue;
    } else if (rank >= 17) {
      return Colors.red;
    } else if (rank == 5) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }
}
