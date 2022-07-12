import 'package:faker/faker.dart';
import 'package:floor_database/DAO/EmployeeDAO.dart';
import 'package:floor_database/database/database.dart';
import 'package:floor_database/entity/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabse.databaseBuilder('database.db').build();
  final dao = database.employeeDAO;
  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final EmployeeDAO dao;
  MyApp({required this.dao});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floor database',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(dao: dao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.dao});
  final EmployeeDAO dao;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Floor database'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  final employee = Employee(
                      firstName: Faker().person.firstName(),
                      lastname: Faker().person.lastName(),
                      email: Faker().internet.email());
                  await widget.dao.insertEmployee(employee);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Add success'),
                    duration: Duration(seconds: 1),
                  ));
                }),
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  widget.dao.deleteAllEmployee();
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Clear success'),
                      duration: Duration(seconds: 1),
                    ));
                  });
                })
          ],
        ),
        body: StreamBuilder(
          stream: widget.dao.getAllEmployee(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      child: ListTile(
                        title: Text(
                            '${snapshot.data?[index].firstName} ${snapshot.data?[index].lastname}'),
                        subtitle: Text('${snapshot.data?[index].email}'),
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                              icon: Icons.update,
                              label: 'Update',
                              onPressed: ((context) async {
                                final updateEmployee = snapshot.data![index];
                                updateEmployee.firstName =
                                    Faker().person.firstName();
                                updateEmployee.lastname =
                                    Faker().person.lastName();
                                updateEmployee.email = Faker().internet.email();
                                await widget.dao.updateEmployee(updateEmployee);
                              })),
                          SlidableAction(
                              icon: Icons.delete,
                              label: 'Delete',
                              onPressed: ((context) async {
                                final deleteEmployee = snapshot.data![index];
                                await widget.dao.deleteEmployee(deleteEmployee);
                              }))
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
