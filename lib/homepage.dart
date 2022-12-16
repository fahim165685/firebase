import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/addProduct.dart';
import 'package:firestore/productItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: Icon(
                      Icons.list,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 30),
                    child: Text(
                      "Drawer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                "Home Page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
            ),
            const Divider(
              height: 10,
              color: Colors.black,
              indent: 65,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_box,
                color: Colors.orangeAccent,
              ),
              title: const Text(
                "Add Gadgets ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(AddUser.routeName);
              },
            ),
            const Divider(
              height: 10,
              indent: 65,
              color: Colors.black,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("GADGETS LIST"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_b_and_w,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:  FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return ProductItem(
                      documentSnapshot: data,
                     // id: data.id,
                      //isFavourite: data['isFavourite'],
                      imageUrl: data['img'],
                      productName: data['name'],
                      productPrice: data['price'],
                    );
                  },
                );
        },
      ),
    );
  }
}
