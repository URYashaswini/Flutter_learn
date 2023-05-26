import 'package:drift_database/screen/add_employee_screen.dart';
import 'package:drift_database/screen/edit_employee_screen.dart';
import 'package:drift_database/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => const AddEmployeeScreen());
      case '/edit_employee':
        return MaterialPageRoute(builder: (_) => const EditEmployeeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: Center(
            child: Text(
          'Sorry no route was found',
          style: TextStyle(color: Colors.amber[800]),
        )),
      );
    });
  }
}
