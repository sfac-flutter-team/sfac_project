import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/model/purchase.dart';
import 'package:sfac_project/service/db_service.dart';

class PurchaseHistoryController extends GetxController {
  //구매내역 리스트
  RxList<Purchase> shoppingBasket = <Purchase>[].obs;

  RxList<QueryDocumentSnapshot<Purchase>> purchaseList =
      RxList<QueryDocumentSnapshot<Purchase>>();

  String uid = Get.find<AuthController>().user!.uid;

  RxBool isLoading = false.obs;

  //구매내역 가져오기
  readPurchase() async {
    isLoading(true);
    purchaseList(await DBService().getPurchaseWithId(uid));
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    readPurchase();
  }
}
