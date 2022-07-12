import 'package:flutter/material.dart';

class CustomDatePickerFormFeild extends StatelessWidget {
  const CustomDatePickerFormFeild(
      {Key? key,
      required TextEditingController controller,
      required String txtlabel,
      required VoidCallback callback})
      : _DobController = controller,
        _txtlabel = txtlabel,
        _callback = callback,
        super(key: key);
  final TextEditingController _DobController;
  final String _txtlabel;
  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _DobController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(_txtlabel)),
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return '$_txtlabel cannot be empty';
          }
          return null;
        }),
        onTap: _callback);
  }
}
