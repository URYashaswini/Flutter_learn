import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:apicalls/Album.dart';
import 'package:http/http.dart' as http;

class datapage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return datapagestate();
  }
}

class datapagestate extends State<datapage> {
  Future fetchdata() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var jsonData = jsonDecode(response.body);
    List<Album> albums = [];
    for (var i in jsonData) {
      Album album = Album(userId: i['userId'], id: i['id'], title: i['title']);
      albums.add(album);
    }
    print(albums.length);
    return albums;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Api exmaple')),
        body: Container(
            child: Card(
          child: FutureBuilder(
            future: fetchdata(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text('loading')),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data[i].id.toString()),
                        subtitle: Text(snapshot.data[i].title),
                        trailing: Text(snapshot.data[i].userId.toString()),
                      );
                    });
              }
            },
          ),
        )),
      ),
    );
  }
}
