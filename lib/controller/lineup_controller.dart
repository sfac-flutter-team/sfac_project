import 'package:get/get.dart';
import 'package:sfac_project/service/api_service.dart';

class LineupController extends GetxController {
  int fixtureId = Get.arguments;
  RxString tempStr = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    tempStr(await ApiSerive().getLineup(fixtureId));
  }
}
