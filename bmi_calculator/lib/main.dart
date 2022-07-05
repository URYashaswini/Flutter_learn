import 'package:bmi_calculator/Home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFffffff),
          scaffoldBackgroundColor: Color(0xFFf6f8ff)),
      home: MyHomePage(),
    );
  }
}
