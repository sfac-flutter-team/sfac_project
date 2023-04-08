import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/controller/fixture_controller.dart';
import 'package:sfac_project/util/app_routes.dart';

class FixtureScreen extends GetView<FixtureController> {
  const FixtureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => controller.selectDate(context),
          child: const Text('날짜 선택'),
        ),
        Obx(
          () => Text(DateFormat('yyyy년 MM월 dd일 E', 'ko')
              .format(controller.selectedDate.value)),
        ),
        Obx(
          () {
            if (controller.currentFixtures.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.currentFixtures.length,
                itemBuilder: (context, index) {
                  var fixture = controller.currentFixtures[index];
                  return InkWell(
                    onTap: () =>
                        Get.toNamed(AppRoutes.lineup, arguments: fixture.id),
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(DateFormat('HH:mm').format(fixture.date)),
                          Text(fixture.home.name),
                          if (fixture.homeGoals != null)
                            Text(fixture.homeGoals.toString()),
                          if (fixture.awayGoals != null)
                            Text(fixture.awayGoals.toString()),
                          if (fixture.homeGoals == null &&
                              fixture.awayGoals == null)
                            Text(fixture.status),
                          Text(fixture.away.name),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('오늘은 경기가 없습니다!');
            }
          },
        ),
      ],
    );
  }
}
