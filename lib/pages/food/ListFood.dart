import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/food/fooditem.dart';
import 'package:http/http.dart' as http;

class ListFood extends StatefulWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {

  var items = [
    FoodItem(1,"ข้าวไข่เจียว",25,"kao_kai_jeaw.jpg"),
    FoodItem(2,"ข้าวหมูแดง",30,"kao_moo_dang.jpg"),
    FoodItem(3,"ข้าวมันไก่",25,"kao_mun_kai.jpg"),
    FoodItem(4,"ข้าวหน้าเป็ด",40,"kao_na_ped.jpg"),
    FoodItem(5,"ข้าวพัด",30,"kao_pad.jpg"),
    FoodItem(6,"ผัดซีอิ้ว",30,"pad_sie_eew.jpg")
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){goDetail(items[index]);},
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(height: 100,width: 100,child: Image.asset('assets/images/${items[index].image}')),
                      Text(
                        '${items[index].name}  \n${items[index].price}บาท',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
  void goDetail(FoodItem item){
    Navigator.pushNamed(
      context,
      "/detail",
    arguments: item,
    );

  }
}
