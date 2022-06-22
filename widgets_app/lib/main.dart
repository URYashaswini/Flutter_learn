import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_app/Gridviews.dart';
import 'package:widgets_app/forms.dart';
import 'package:widgets_app/listviews.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return navigationBar();
  }
}

class navigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _navigationBarState();
  }
}

class _navigationBarState extends State<navigationBar> {
  int _currentindex = 0;
  final tabs = [
    const Center(
        child: Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.normal,
      ),
    )),
    formscreen(),
    gridview(),
    list(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          selectedItemColor: Colors.grey[600],
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Form',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3),
              label: 'Gridview',
              backgroundColor: Colors.teal,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ListView',
              backgroundColor: Colors.cyan,
            )
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ),
      ),
    );
  }
}
