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
      {
      //마켓스크린에서 사진,상품이름,가격만 나와있으니 다른건 nullable?
      required this.productId,
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
        productDetail: map['productDetail'],
        option: map['option']);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
