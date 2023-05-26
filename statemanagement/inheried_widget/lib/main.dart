import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.amber,
      ),
      home:   HomepageInherited(
        homepage: Homepage(),
        child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueKey _valueKey =ValueKey<String?>(null);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      
        title:const  Text("Inherited widget"),
      ),
      body: GestureDetector(
        onTap: () async{
          final homepage =HomepageInherited.of(context).homepage;
          final dateAndtime =await homepage.getdateAndTime();
          setState(() {
            _valueKey =ValueKey(dateAndtime);
            
          });
        },
        child: Container(color: Colors.white,
        child: Center(
          child: DateTimeWidget(key: _valueKey,)
        ,
        ),
        ),
      ),  
    );
  }
}
class HomepageInherited extends InheritedWidget {
  String uuid;
  final Homepage homepage;
  HomepageInherited({Key? key,
  required this.homepage ,
   required this.child}) 
  :uuid=Uuid().v4(), 
  super(key: key, 
  child: child);

  final Widget child;

  static HomepageInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomepageInherited>()!;
  }

  @override
  bool updateShouldNotify(HomepageInherited oldWidget) {
    return uuid!=oldWidget.uuid;
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homepage=HomepageInherited.of(context).homepage;
    return Text(homepage.dateAndTime ?? 'Tap on the screen',style: const TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,color: Colors.grey),);
  }
}

class Homepage{
  String? dateAndTime;
  Future<String> getdateAndTime(){
    return Future.delayed(const Duration(seconds: 1),
    ()=> DateFormat('dd-MM-yyyy/ hh:mm:ss').format(DateTime.now())).then((value) { dateAndTime =value;
    return value;});
  }
}
