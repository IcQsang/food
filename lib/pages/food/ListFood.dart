import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/food/fooditem.dart';

class ListFood extends StatefulWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {

  var items = [
    FoodItem(1,"ข้าวไข่เจียว",25,"kao_kai_jeaw.jpg"),
    FoodItem(2,"ข้าวหมูแดง",30,"kao_moo_dang.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(height: 100,width: 100,child: Image.asset('assets/images/${items[index].image}')),
                    Text(
                      '${items[index].name}  ${items[index].price}฿',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
