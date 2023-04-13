// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sfac_project/model/product.dart';

class ShoppingBasket {
  int quantity;
  String? selectedOption;
  Product product;

  ShoppingBasket({
    required this.quantity,
    this.selectedOption,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'selectedOption': selectedOption,
      'product': product.toMap(),
    };
  }

  factory ShoppingBasket.fromMap(Map<String, dynamic> map) {
    return ShoppingBasket(
      quantity: map['quantity'] as int,
      selectedOption: map['selectedOption'] != null
          ? map['selectedOption'] as String
          : null,
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingBasket.fromJson(String source) =>
      ShoppingBasket.fromMap(json.decode(source) as Map<String, dynamic>);
}
