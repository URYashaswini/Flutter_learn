import 'package:flutter/material.dart';

class gridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GridView',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.teal,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Container(
            color: Colors.teal[50],
            child: const Center(
                child: Text(
              "1",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[100],
            child: const Center(
                child: Text(
              "2",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[200],
            child: const Center(
                child: Text(
              "3",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[300],
            child: const Center(
                child: Text(
              "4",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[400],
            child: const Center(
                child: Text(
              "5",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[500],
            child: const Center(
                child: Text(
              "6",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[600],
            child: const Center(
                child: Text(
              "7",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[700],
            child: const Center(
                child: Text(
              "8",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[800],
            child: const Center(
                child: Text(
              "9",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
          Container(
            color: Colors.teal[900],
            child: const Center(
                child: Text(
              "10",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey),
            )),
          ),
        ],
      ),
    );
  }
}
