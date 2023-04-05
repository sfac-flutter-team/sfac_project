import 'dart:convert';

class Product {
  String productId;
  String productName;
  String price;
  String imageUrl;
  String? productInfo;
  String? delivery;
  List<String>? productDetail;
  List<String>? option;

  Product(
      {required this.productId,
      required this.productName,
      required this.price,
      this.delivery,
      required this.imageUrl,
      this.productInfo,
      this.productDetail,
      this.option});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'price': price,
      'imageUrl': imageUrl,
      'productInfo': productInfo,
      'delivery': delivery,
      'productDetail': productDetail,
      'option': option
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        productId: map['productId'] as String,
        productName: map['productName'] as String,
        price: map['price'] as String,
        delivery: map['delivery'] as String,
        imageUrl: map['imageUrl'] as String,
        productInfo: map['productInfo'] as String,
        productDetail: List<String>.from(map['productDetail']),
        option: List<String>.from(map['option']));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
