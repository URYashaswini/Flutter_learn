import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/homepage.dart';
import 'package:sharedpreference/welcomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.amber),
      home: firstPage(),
    );
  }
}

class firstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _firstPageState();
  }
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sharedprference')),
      body: Center(
          child: ElevatedButton(
        child: Text('Click', style: TextStyle(color: Colors.black)),
        onPressed: () async {
          bool visitingflag = await getVisitingFlag();
          setvisitingFlag();
          if (visitingflag == true) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => WelcomePage()));
          }
        },
      )),
    );
  }
}

setvisitingFlag() async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('visited', true);
}

getVisitingFlag() async {
  final pref = await SharedPreferences.getInstance();
  bool visited = pref.getBool("visited") ?? false;
  return visited;
}
