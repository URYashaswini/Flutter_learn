import 'package:drift_database/data/local/db/app_db.dart';
import 'package:drift_database/widget/custom_date_picker_form_field.dart';
import 'package:drift_database/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  late AppDb _db;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _DOBController = TextEditingController();
  DateTime? _dateofBirth;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _DOBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                addEmployee();
                _DOBController.clear();
                _firstNameController.clear();
                _lastNameController.clear();
                _userNameController.clear();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextFormField(
                controller: _userNameController, txtlabel: 'User name'),
            const SizedBox(
              height: 8.0,
            ),
            customTextFormField(
                controller: _firstNameController, txtlabel: 'First name'),
            const SizedBox(
              height: 8.0,
            ),
            customTextFormField(
                controller: _lastNameController, txtlabel: 'Last name'),
            const SizedBox(
              height: 8.0,
            ),
            CustomDatePickerFormFeild(
              controller: _DOBController,
              txtlabel: 'Date of Birth',
              callback: () => DOBPicker(context),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> DOBPicker(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateofBirth ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.black),
                dialogBackgroundColor: Colors.white),
            child: child ?? const Text('')));
    if (newDate == null) {
      return;
    }
    setState(() {
      _dateofBirth = newDate;
      String dob = DateFormat('dd/mm/yyyy').format(newDate);
      _DOBController.text = dob;
    });
  }

  void addEmployee() {
    final entity = EmployeeCompanion(
      userName: drift.Value(_userNameController.text),
      firtName: drift.Value(_firstNameController.text),
      lastName: drift.Value(_lastNameController.text),
      dateOfBirth: drift.Value(_dateofBirth!),
    );
    _db.insertEmployee(entity).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.amber,
              content: Text('New employee inserted $value'),
              actions: [
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                    child: Text('Close'))
              ],
            ),
          ),
        );
  }
}
