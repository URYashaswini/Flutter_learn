import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffffff),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ContainerBox(
                  boxColor: Color(0xFFffffff),
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.male,
                        size: 60.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Male",
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 20.0),
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ContainerBox(
                    boxColor: Color(0xFFffffff),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.female,
                          size: 60.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                              color: Color(0xFF000000), fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ContainerBox(
              boxColor: Color(0xFFffffff),
              childWidget: Column(
                children: const [
                  Icon(
                    Icons.male,
                    size: 80.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(color: Color(0xFF000000), fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ContainerBox(
                  boxColor: Color(0xFFffffff),
                  childWidget: Column(
                    children: const [
                      Icon(
                        Icons.male,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Male",
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 20.0),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ContainerBox(
                  boxColor: Color(0xFFffffff),
                  childWidget: Column(
                    children: const [
                      Icon(
                        Icons.male,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Male",
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 20.0),
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final Color boxColor;
  final Widget childWidget;
  ContainerBox({required this.boxColor, required this.childWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: boxColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: const Offset(0, 3))
          ]),
    );
  }
}
