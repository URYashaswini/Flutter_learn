import 'package:dynamic_theme/ThemePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool darkThemeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Theme',
      theme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Homepage(),
    );
  }

  Widget Homepage() {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Theme')),
      body: const Center(
        child: Text('Hello World'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Dark Theme'),
              trailing: Switch(
                  value: darkThemeEnabled,
                  onChanged: (changedTheme) {
                    setState(() {
                      darkThemeEnabled = changedTheme;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
