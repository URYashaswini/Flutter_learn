import 'package:assets_loading/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class imagejsonpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return imagejsonpagestate();
  }
}

class imagejsonpagestate extends State<imagejsonpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: ReadImageJson(),
          builder: (context, data) {
            if (data.hasError) {
              return Material(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              var items = data.data as List<datamodel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                items[index].imageurl.toString(),
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Text(
                                  "${items[index].name}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'AnekLatin',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey),
                                ),
                              )
                            ]),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<datamodel>> ReadImageJson() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('jsonfile/image.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => datamodel.fromjson(e)).toList();
  }
}
