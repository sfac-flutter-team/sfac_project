import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/shoppingbasket.dart';

class DBService {
  final productRef = FirebaseFirestore.instance
      .collection('product')
      .withConverter(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (product, _) => product.toMap());

  final shoppingBasketRef = FirebaseFirestore.instance
      .collection('shoppingBasket')
      .withConverter(
          fromFirestore: (snapshot, _) => snapshot
              .data()![FieldPath.documentId]
              .map((value) => ShoppingBasket.fromMap(value))
              .toList(),
          toFirestore: (shoppingBasket, _) => {});

  Future<List<QueryDocumentSnapshot<Product>>> readProduct() async {
    var items = await productRef.get();
    return items.docs;
  }

  Future<List<QueryDocumentSnapshot<Product>>> getProduct(
      String productId) async {
    var data = await productRef.where('productID', isEqualTo: productId).get();
    return data.docs;
  }

  // createShoppingBasket(String productId, ShoppingBasket shoppingbasket) {
  //   shoppingBasketRef.doc(productId).set(shoppingbasket);
  // }

  // deleteShoppingBasket(String productId) {
  //   shoppingBasketRef.doc(productId).delete();
  // }

  // quantityUp(String id) =>
  //     shoppingBasketRef.doc(id).update({'quantity': FieldValue.increment(1)});
  // quantityDown(String id) =>
  //     shoppingBasketRef.doc(id).update({'quantity': FieldValue.increment(-1)});
}
