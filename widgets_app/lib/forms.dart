import 'package:flutter/material.dart';
import 'package:widgets_app/Gridviews.dart';

class formscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _formscreenstate();
  }
}

class _formscreenstate extends State<formscreen> {
  String _username = '';
  String _password = '';
  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'name is required';
        }
      },
      onSaved: (newValue) {
        _username = newValue!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Password', border: OutlineInputBorder()),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password required';
        }
      },
      onSaved: (newValue) {
        _password = newValue!;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                const SizedBox(
                  height: 10,
                ),
                _buildPassword(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      _navigatetonextscreen(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )),
      ),
    );
  }

  void _navigatetonextscreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => gridview()));
  }
}
