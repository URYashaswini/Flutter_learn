import 'dart:convert';

import 'package:apicalling/data/post_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePostPage extends StatelessWidget {
  SinglePostPage({required this.postId, Key? key}) : super(key: key);
  int postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Bolg'),
      ),
      body: FutureBuilder<Response>(
          future: Provider.of<PostApiService>(context).getPost(postId),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              final Map post = json.decode(snapShot.data!.bodyString);
              return _buildPost(post);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget _buildPost(Map post) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Text(
          post['title'],
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          post['body'],
          style: const TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}
