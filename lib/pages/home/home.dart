import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: _subPageIndex==1?Text('FOOD'):_subPageIndex==2?Text('PROFILE'):Text('FLUTTER FOOD'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple,
            Colors.purpleAccent,
          ],)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100000.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset('assets/images/profile.png'),
                      )),
                  Text(
                    'Promlert Lovichit',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    'promlert@gmail.com',
                    style: TextStyle(fontSize: 10.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood,color: _subPageIndex==1?Colors.purple:Colors.black,), 'Food'),
              onTap: () => _showSubPage(1),
              selected: _subPageIndex==1,
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person,color: _subPageIndex==2?Colors.purple:Colors.black,), 'Profile'),
              onTap: () => _showSubPage(2),
                selected:_subPageIndex==2,
            ),
          ],

        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return Center(
            child: Text(
          'THIS IS A HOME PAGE',
        ));
      case 1:
        return FoodPage();
      case 2:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}

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
              ? Text("Food Menu")
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
