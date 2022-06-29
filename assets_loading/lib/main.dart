import 'package:assets_loading/imagejsonpage.dart';
import 'package:assets_loading/jsonpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(
    myAppp(),
  );
}

class myAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _currentindex = 0;
  final tabs = [
    jsonpage(),
    imagejsonpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jsonFile'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[300],
        currentIndex: _currentindex,
        selectedItemColor: Colors.amber[200],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article')
        ],
        onTap: (index) => setState(() {
          _currentindex = index;
        }),
      ),
      body: tabs[_currentindex],
    );
  }

//   Future<List<datamodel>> readdata() async {
//     final jsondata = await rootBundle.loadString('jsonfile/person.json');
//  final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => datamodel.fromJson(e).toList);
//   }
}
