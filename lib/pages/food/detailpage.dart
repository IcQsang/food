import 'package:flutter/material.dart';
import 'package:food/pages/food/fooditem.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              child: Image.asset('assets/images/${item.image}')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("$item" ,style: TextStyle(fontSize: 30),),
          ),
        ],
      ),
    );
  }
}
