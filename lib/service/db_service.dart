import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sfac_project/model/product.dart';

class DBService {
  final productRef = FirebaseFirestore.instance
      .collection('product')
      .withConverter(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (product, _) => product.toMap());

  Future<List<QueryDocumentSnapshot<Product>>> readProduct() async {
    var items = await productRef.get();
    return items.docs;
  }
}
