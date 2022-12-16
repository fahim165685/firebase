import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/controller/controller.dart';
import 'package:firestore/model/prodact_list.dart';
import 'package:firestore/productItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FirebaseController controller=Get.put(FirebaseController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Product"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context, snapshot) {

          if (snapshot.hasData){
           return ListView.builder(
             itemCount: snapshot.data?.docs.length,
             itemBuilder: (context, index) {
               DocumentSnapshot data = snapshot.data!.docs[index];
               // children: snapshot.data!.docs.map((DocumentSnapshot document) {
               //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
               // }).toList();

               return ItemCard(
                 onTap: () {},
                 onEdit: () {
                   controller.getData();
                 },
                 onDelete: () {},
                 name: data['price'],
                 price: data['name'],
                 img: data['productImageURL'],
               );

             });
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key, required this.img,
    required this.name,
    required this.price,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final String img;
  final String name;
  final String price;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          //image
          Expanded(flex: 3, child:Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
            child: Text(img,maxLines: 3,),
          ) ),
          const SizedBox(
            width: 5,
          ),
          //Name
          Expanded(flex: 5,child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Text(name.toUpperCase(),style: const TextStyle(fontSize: 25),),
              Text("\$$price".toUpperCase(),style: const TextStyle(fontSize: 25,color: Colors.deepPurpleAccent),)
            ],
          ) ),
          //Edit & Delete
          Expanded(flex: 2,child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children:  [
              IconButton(onPressed: onEdit, icon: const Icon(Icons.edit,color: Colors.green,)),
              IconButton(onPressed: onDelete, icon: const Icon(Icons.delete,
                color: Colors.red,
               )),
          ],) ),
        ],
      ),
    );
  }
}
