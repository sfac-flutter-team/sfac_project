import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:sfac_project/controller/auth_controller.dart';
import 'package:sfac_project/controller/shopping_basket_controller.dart';
import 'package:sfac_project/model/purchase.dart';
import 'package:sfac_project/model/shoppingbasket.dart';
import 'package:sfac_project/service/db_service.dart';
import 'package:sfac_project/util/app_routes.dart';

enum BuyType { fromShppingBasketPage, fromProductPage }

class BuyerInfoController extends GetxController {
  User user = Get.find<AuthController>().user!;
  var shoppingBasketController = Get.find<ShoppingBasketController>();
  var arg = Get.arguments['shoppingBasket'];

  var nameController = TextEditingController();
  var phonenumController = TextEditingController();
  var postcodeController = TextEditingController();
  var addressController = TextEditingController();
  var addressDetailController = TextEditingController();

  RxBool isButtonActivate = false.obs; //구매하기 버튼 비활성화

  BuyType buyType = Get.arguments['buyType'];

  /// Form State
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void searchAddress(BuildContext context) async {
    KopoModel? model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );

    if (model != null) {
      final postcode = model.zonecode ?? '';
      postcodeController.value = TextEditingValue(
        text: postcode,
      );
      formData['postcode'] = postcode;

      final address = model.address ?? '';
      addressController.value = TextEditingValue(
        text: address,
      );
      formData['address'] = address;

      final buildingName = model.buildingName ?? '';
      addressDetailController.value = TextEditingValue(
        text: buildingName,
      );
      formData['address_detail'] = buildingName;
    }
  }

  //구매하기버튼 활성화하는 함수
  activateButton() {
    if (postcodeController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phonenumController.text.isNotEmpty &&
        addressDetailController.text.isNotEmpty) {
      isButtonActivate.value = true;
    } else {
      isButtonActivate.value = false;
    }
  }

  handlePurchaseButton() {
    var purchase = Purchase(
        uid: user.uid,
        shoppingBasket:
            arg == null ? shoppingBasketController.shoppingBasket : [arg],
        state: '입금 전',
        orderDate: DateTime.now(),
        name: nameController.text,
        phone: phonenumController.text,
        postCode: int.parse(postcodeController.text),
        address: addressController.text,
        addressDetail: addressDetailController.text,
        totalPrice: arg == null
            ? shoppingBasketController.totalPrice.value
            : arg.quantity * arg.product.price);
    DBService().createPurchase(purchase);
    if (buyType == BuyType.fromShppingBasketPage) {
      shoppingBasketController.clearShoppingBasket();
    }
    Get.toNamed(AppRoutes.calculate, arguments: purchase);
  }
}
