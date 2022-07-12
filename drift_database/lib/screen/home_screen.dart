import 'package:drift_database/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppDb _db;
  @override
  void initState() {
    _db = AppDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EmployeeData>>(
        future: _db.getEmployees(),
        builder: (context, snapshot) {
          final List<EmployeeData>? employees = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          if (employees != null) {
            return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return Card(
                    child: Column(
                      children: [
                        Text('${employee.id}'),
                        Text('${employee.userName}'),
                        Text('${employee.firtName} ${employee.lastName}'),
                        Text('${employee.dateOfBirth}'),
                      ],
                    ),
                  );
                });
          }
          return const Center(
            child: Text('No data found'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/add_employee');
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Employee')),
    );
  }
}
