// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sfac_project/model/product.dart';

class ShoppingBasket {
  int quantity;
  Product product;

  ShoppingBasket({
    required this.quantity,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory ShoppingBasket.fromMap(Map<String, dynamic> map) {
    return ShoppingBasket(
      quantity: map['quantity'] as int,
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingBasket.fromJson(String source) =>
      ShoppingBasket.fromMap(json.decode(source) as Map<String, dynamic>);
}
