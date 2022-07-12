import 'package:floor/floor.dart';

@entity
class Employee {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String firstName;
  String lastname;
  String email;

  Employee(
      {this.id,
      required this.firstName,
      required this.lastname,
      required this.email});
}
