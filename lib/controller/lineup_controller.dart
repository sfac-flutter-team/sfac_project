import 'package:get/get.dart';
import 'package:sfac_project/model/lineup.dart';
import 'package:sfac_project/service/api_service.dart';

class LineupController extends GetxController {
  int fixtureId = Get.arguments;
  Rxn<Lineup> homeTeamLineup = Rxn<Lineup>();
  Rxn<Lineup> awayTeamLineup = Rxn<Lineup>();
  RxList<Map<String, dynamic>> tempList = RxList<Map<String, dynamic>>();
  RxBool isLoading = false.obs;

  getLineup() async {
    isLoading(true);
    var res = await ApiSerive().getLineup(fixtureId);
    if (res.isNotEmpty) {
      homeTeamLineup(Lineup.fromMap(res[0]));
      awayTeamLineup(Lineup.fromMap(res[1]));
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getLineup();
  }
}
