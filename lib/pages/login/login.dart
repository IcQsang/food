import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Center(
                      child: Column(
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 100,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    "Enter PIN to login",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))),
              Expanded(
                  child: Center(
                      child: Row(
                children: [
                  for (int i = 0; i < password.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  for (int i = 0; i < 6 - password.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 1; i < 4; i++) Button(num: i, tap: tap)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 4; i < 7; i++) Button(num: i, tap: tap)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 7; i < 10; i++) Button(num: i, tap: tap)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(num: -9, tap: tap),
                        Button(num: 0, tap: tap),
                        Button(num: -1, tap: tap),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void tap(int num) async {
    setState(() {
      if (num == -1 && password.length - 1 != -1) {
        password = password.substring(0, password.length - 1);
      } else if (num >= 0) {
        password = password + "$num";
        // if (password == pin) {
        //   // Navigator.pushReplacement(
        //   //   context,
        //   //   MaterialPageRoute(builder: (context) => Home()),
        //   // );
        //   Navigator.pushReplacementNamed(context, "/home");
        // } else if (password.length == 6) {
        //   _showMaterialDialog("ERROR", "Invalid PIN Please try again");
        //   password = "";
        // }
        if (password.length == 6) {
          var check = checkPIN(password);
          check.then((value) {
            if (value) {
              Navigator.pushReplacementNamed(context, "/home");
            } else
              password = "";
          });
        }
      }
    });
    setState(() {});
    print(password);
  }

  Future<bool> checkPIN(String pin) async {
    var response = await http.post(
      Uri.parse('https://cpsu-test-api.herokuapp.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pin': pin,
      }),
    );
    print(response.body);
    Map map = json.decode(response.body);
    print(map["data"]);
    return map["data"];
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required int num, required Function(int) tap})
      : num = num,
        tap = tap,
        super(key: key);
  final int num;
  final Function(int) tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            tap(num);
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: num == -9
                ? null
                : BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
            child: num == -9
                ? SizedBox.shrink()
                : Center(
                    child: num == -1
                        ? Icon(
                            Icons.backspace_outlined,
                            size: 30.0,
                          )
                        : Text("$num",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
          )),
    );
  }
}
