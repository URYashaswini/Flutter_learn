import 'dart:async';

import 'package:flutter/material.dart';

class Themes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.darkThemeEnabled,
        initialData: false,
        builder: (context, snapshot) => MaterialApp(
              theme: snapshot.data! ? ThemeData.dark() : ThemeData.light(),
              home: Themepage(snapshot.data!),
            ));
  }
}

class Themepage extends StatelessWidget {
  final bool darkThemeEnabled;
  Themepage(this.darkThemeEnabled);
  @override
  Widget build(BuildContext context) {
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
              trailing:
                  Switch(value: darkThemeEnabled, onChanged: bloc.changeTheme),
            )
          ],
        ),
      ),
    );
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
