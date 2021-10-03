import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListFood.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  int _selectedBottomNavIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _selectedBottomNavIndex == 0
              ? ListFood()
              : Text("Your Order")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.purple,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}

