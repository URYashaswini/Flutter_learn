import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Widgets';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: columnwidget(),
        ),
      ),
    );
  }
}

class columnwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return columnwidgetstate();
  }
}

class columnwidgetstate extends State<columnwidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const MyStatelessWidget(),
            const SizedBox(
              width: 20,
            ),
            dropdownwidget()
          ]),
          Image.network(
            "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg",
            height: 300,
            width: 300,
          ),
          const Text(
            "This is network image",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg",
            ),
            radius: 100,
          ),
          Image.asset(
            'images/image.jpeg',
            height: 300,
            width: 300,
          ),
          const Text(
            "This is assets image",
            style: TextStyle(fontSize: 20),
          ),
        ],
      )
    ]);
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Text Button',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class dropdownwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return dropdownwidgetState();
  }
}

class dropdownwidgetState extends State<dropdownwidget> {
  String dropdownValue = 'A';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.arrow_drop_down_rounded),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      items: <String>['A', 'B', 'C', 'D', 'E']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: ((value) => setState(() {
            dropdownValue = value!;
          })),
      value: dropdownValue,
    );
  }
}
