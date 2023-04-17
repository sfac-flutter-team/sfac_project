// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/shoppingbasket.dart';

class Purchase {
  String uid;
  List<ShoppingBasket> shoppingBasket;
  String state;
  DateTime orderDate;
  String name;
  String phone;
  int postCode;
  String address;
  String addressDetail;
  int totalPrice;

  Purchase(
      {required this.uid,
      required this.shoppingBasket,
      required this.state,
      required this.orderDate,
      required this.name,
      required this.phone,
      required this.postCode,
      required this.address,
      required this.addressDetail,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'shoppingBasket': shoppingBasket.map((x) => x.toMap()).toList(),
      'state': state,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'name': name,
      'phone': phone,
      'postCode': postCode,
      'address': address,
      'addressDetail': addressDetail,
      'totalPrice': totalPrice,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      uid: map['uid'] as String,
      shoppingBasket: List<ShoppingBasket>.from(
        (map['shoppingBasket']).map<ShoppingBasket>(
          (x) => ShoppingBasket.fromMap(x as Map<String, dynamic>),
        ),
      ),
      state: map['state'] as String,
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate'] as int),
      name: map['name'] as String,
      phone: map['phone'] as String,
      postCode: map['postCode'] as int,
      address: map['address'] as String,
      addressDetail: map['addressDetail'] as String,
      totalPrice: map['totalPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source) as Map<String, dynamic>);
}
