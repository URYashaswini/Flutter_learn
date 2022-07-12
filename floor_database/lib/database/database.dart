import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database/DAO/EmployeeDAO.dart';
import 'package:floor_database/entity/employee.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Employee])
abstract class AppDatabse extends FloorDatabase {
  EmployeeDAO get employeeDAO;
}
