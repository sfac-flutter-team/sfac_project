import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_color.dart';

class FixtureController extends GetxController {
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now()); // 선택된 날짜
  QueryDocumentSnapshot<dynamic>? fixtures; //전체 경기 결과 및 일정
  RxList currentFixtures = [].obs; //선택된 날짜의 경기 및 일정
  RxBool isLoading = false.obs; //데이터 로딩 중 체크
  DateTime? tempTime;

  selectDate(BuildContext context) async {
    selectedDate.value = await showDatePicker(
          context: context,
          initialDate: selectedDate.value,
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 1),
          currentDate: selectedDate.value,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColor.mainBlue, // <-- SEE HERE
                  onSurface: AppColor.mainDarkBlue, // <-- SEE HERE
                ),
              ),
              child: child!,
            );
          },
        ) ??
        selectedDate.value;

    filteringFixtures(selectedDate.value);
  }

  //전체 결과 및 일정 가져오기
  readFixtures() async {
    isLoading(true);
    fixtures = await DBService().readFixtures();
    filteringFixtures(selectedDate.value);
    isLoading(false);
  }

  //날짜에 맞는 결과 및 일정만 필터링
  filteringFixtures(DateTime date) {
    currentFixtures.clear();
    currentFixtures.addAll(
      fixtures!
          .data()
          .where((e) =>
              DateFormat('dd-MM-yyyy').format(e.date) ==
              DateFormat('dd-MM-yyyy').format(date))
          .toList(),
    );

    currentFixtures.sort((a, b) => (a.date).compareTo(b.date));
  }

  @override
  void onInit() {
    super.onInit();
    readFixtures();
  }
}
