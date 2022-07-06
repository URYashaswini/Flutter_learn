import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: const Center(
        child: Text('This is Welcome page of the app it opens only first time'),
      ),
    );
  }
}
