import 'package:firestore/home/components/add_prodact.dart';
import 'package:firestore/home/components/show_prodact.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex =0;

  List page = [
    const ShowProduct(),
    const AddProduct(),
    const Text("ADD Product3"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (value) {
          setState(() {
            activeIndex=value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "add product"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorite"
          ),

        ],
      ),
      body: page[activeIndex],
    );
  }
}
