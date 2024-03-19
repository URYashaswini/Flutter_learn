import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formbuilder/form_view/generate_form.dart';
import 'package:size_config/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
        referenceHeight: 900,
        referenceWidth: 350,
        builder: (context, orientation) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextFieldsView subscriberForm = TextFieldsView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // using .h and .w for responsive width and height
          Image.network(
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
            height: 200.h,
            width: 300.w,
            scale: 0.5,
          ),
          // using .sp for responsive font size
          Text(
            "Login",
            style: TextStyle(fontSize: 22.sp),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12.sp),
                  constraints: BoxConstraints(maxWidth: 400.w, maxHeight: 30.h),
                  hintText: "Enter Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(fontSize: 12.sp),
              obscureText: true,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                  constraints: BoxConstraints(maxWidth: 400.w, maxHeight: 30.h),
                  hintText: "Enter Password"),
            ),
          ),
          MaterialButton(
            onPressed: () {
              print("Logged in successfully");
            },
            height: 20.h,
            minWidth: 100.h,
          )
        ],
      ),
    ));
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //       title: Text(widget.title),
    //     ),
    //     body: Column(
    //       children: [
    //         subscriberForm.getView(),
    //         IconButton(
    //             onPressed: () {
    //               log("${subscriberForm.getFormData()}");
    //             },
    //             icon: Icon(Icons.add))
    //       ],
    //     ));
  }
}
