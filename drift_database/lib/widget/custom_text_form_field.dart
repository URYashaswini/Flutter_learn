import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  const customTextFormField(
      {Key? key,
      required TextEditingController controller,
      required String txtlabel})
      : _controller = controller,
        _txtlabel = txtlabel,
        super(key: key);

  final TextEditingController _controller;
  final String _txtlabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text('$_txtlabel')),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return '$_txtlabel cannot be empty';
        }
        return null;
      }),
    );
  }
}
