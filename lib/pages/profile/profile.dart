import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(1000000000000000000.0),
                child: Container(
                  width: 400.0,
                  height: 400.0,
                  child: Image.asset('assets/images/profile.png'),
                )),
            Text(
              'Promlert Lovichit',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            Text(
              'promlert@gmail.com',
              style: TextStyle(fontSize: 10.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
