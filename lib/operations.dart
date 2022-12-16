import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String productName, String productPrice, String imageUrl,) async {
  await FirebaseFirestore.instance.collection("products").add({
    'name': productName,
    'price': productPrice,
    'img': imageUrl,
  });
  print("object");
}

Future<void> editProduct(bool isFavourite, String id) async {
  await FirebaseFirestore.instance.collection("products").doc(id).update({"isFavourite": !isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  await FirebaseFirestore.instance.collection("products").doc(doc.id).delete();
}
