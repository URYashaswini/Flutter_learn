import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class jsonpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return jsonpagestate();
  }
}

class jsonpagestate extends State<jsonpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        builder: (context, snapshot) {
          var showData = json.decode(snapshot.data.toString());
          return showData == null
              ? SizedBox()
              : ListView.builder(
                  itemCount: showData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        showData[index]['name'],
                        style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontStyle: FontStyle.normal),
                      ),
                      subtitle: Text(showData[index]['email'],
                          style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontStyle: FontStyle.italic)),
                    ); // Card(
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         showData[index]['name'],
                    //         style: const TextStyle(
                    //             fontFamily: 'OpenSans',
                    //             fontStyle: FontStyle.normal),
                    //       ),
                    //       Text(
                    //         showData[index]['email'],
                    //         style: const TextStyle(
                    //             fontFamily: 'OpenSans',
                    //             fontStyle: FontStyle.normal),
                    //       )
                    //     ],
                    //   ),
                  });
        },
        future:
            DefaultAssetBundle.of(context).loadString('jsonfile/person.json'),
      ),
    );
  }
}
