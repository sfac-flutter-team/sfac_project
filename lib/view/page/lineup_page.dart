import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/lineup_controller.dart';

class LineupPage extends GetView<LineupController> {
  const LineupPage({super.key});
  static const route = '/lineup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라인업'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              '홈 팀',
            ),
            const Text('선발 선수'),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.homeTeamLineup.value?.players.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        controller.homeTeamLineup.value!.players[index].name),
                    leading: CircleAvatar(
                      child: Text(controller
                          .homeTeamLineup.value!.players[index].number
                          .toString()),
                    ),
                  );
                },
              ),
            ),
            const Text('후보 선수'),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.homeTeamLineup.value?.substitutes.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller
                        .homeTeamLineup.value!.substitutes[index].name),
                    leading: CircleAvatar(
                      child: Text(controller
                          .homeTeamLineup.value!.substitutes[index].number
                          .toString()),
                    ),
                  );
                },
              ),
            ),
            const Text(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              '어웨이 팀',
            ),
            const Text('선발 선수'),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.awayTeamLineup.value?.players.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        controller.awayTeamLineup.value!.players[index].name),
                    leading: CircleAvatar(
                      child: Text(controller
                          .awayTeamLineup.value!.players[index].number
                          .toString()),
                    ),
                  );
                },
              ),
            ),
            const Text('후보 선수'),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.awayTeamLineup.value?.substitutes.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller
                        .awayTeamLineup.value!.substitutes[index].name),
                    leading: CircleAvatar(
                      child: Text(controller
                          .awayTeamLineup.value!.substitutes[index].number
                          .toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
