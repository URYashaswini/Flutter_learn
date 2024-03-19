import 'dart:developer';

import 'package:apicalling/data/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

import 'home_page.dart';

void main() {
  _setUpLogging();
  runApp(const MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    log('${event.level.name} : ${event.time} :${event.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      child: const MaterialApp(
        title: "API Demo",
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
