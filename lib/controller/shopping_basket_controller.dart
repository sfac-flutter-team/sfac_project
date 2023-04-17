import 'package:get/get.dart';
import 'package:sfac_project/model/shoppingbasket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBasketController extends GetxController {
  // 이 컨트롤러는 앱 초기화시 같이 올라가는 컨트롤러
  SharedPreferences? pref;

  //장바구니 리스트
  RxList<ShoppingBasket> shoppingBasket = <ShoppingBasket>[].obs;

  //총 금액
  RxInt totalPrice = 0.obs;

  readShopingBasket() async {
    // Shpping Baskets을 SharedPreferences에서 불러오기
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getStringList('shoppingBasket');
    if (data != null) {
      var res = data.map((e) => ShoppingBasket.fromJson(e)).toList();
      print(shoppingBasket.value);
      shoppingBasket(res);
    }
  }

  saveShoppingBasket(shoppingBasket) async {
    // Shpping Baskets을 SharedPreferences에 저장하기
    var data =
        List<String>.from(shoppingBasket.value.map((e) => e.toJson()).toList());
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('shoppingBasket', data);
    carculateTotalPrice();
  }

  // RxList
  addShoppingBasket(ShoppingBasket basket) => shoppingBasket.add(basket);

  removeShoppingBasket(index) {
    shoppingBasket.removeAt(index);
  }

  handleAmountUp(amount, index) {
    amount.value += 1;
    shoppingBasket[index].quantity += 1;
    saveShoppingBasket(shoppingBasket);
  }

  handleAmountDown(amount, index) {
    if (amount.value > 1) {
      amount.value -= 1;
      shoppingBasket[index].quantity -= 1;
      saveShoppingBasket(shoppingBasket);
    }
  }

  clearShoppingBasket() {
    shoppingBasket.clear();
  }

  carculateTotalPrice() {
    totalPrice.value = 0;
    shoppingBasket.forEach((element) {
      totalPrice.value += (element.quantity * element.product.price);
    });
  }

  // 컨트롤러가 생성되면 readShopingBasket()함수 실행
  @override
  void onInit() async {
    super.onInit();
    await readShopingBasket();
    carculateTotalPrice();

    // shoppingBasket 변수가 업데이트될때마다 updateShoppingBasket 함수 실행하려고
    ever(shoppingBasket, (_) {
      saveShoppingBasket(shoppingBasket);
    });
  }
}
