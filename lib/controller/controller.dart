import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class  FirebaseController extends GetxController {

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  Future<void> uploadData({
  required String name,
    required String price,
    required String makingTime,
    required String deliveryTime,
    required String productImageURL,
    required String productDescription,})async {

    await FirebaseFirestore.instance.collection("user").add({
      'name':name,
      'price':price,
      'makingTime':makingTime,
      'deliveryTime':deliveryTime,
      'productImageURL':productImageURL,
      'productDescription':productDescription,
    });
  }



  Future<void>getData() async{
    var response = FirebaseFirestore.instance.collection("user").snapshots();
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
  }

  
}


