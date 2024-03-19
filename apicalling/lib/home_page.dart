import 'dart:convert';
import 'dart:developer';

import 'package:apicalling/data/post_api_service.dart';
import 'package:apicalling/single_post_page.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chopper Blog'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final response = await Provider.of<PostApiService>(context)
              .postPost({'key': 'value'});
          log(response.body);
        },
      ),
      body: _buildBody(context),
    );
  }
}

FutureBuilder<Response> _buildBody(BuildContext context) {
  return FutureBuilder(
    future: Provider.of<PostApiService>(context).getPosts(),
    builder: (context, snapShot) {
      if (snapShot.connectionState == ConnectionState.done) {
        if (snapShot.hasError) {
          return Center(
            child: Text(
              snapShot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
        final List posts = json.decode(snapShot.data!.bodyString);
        return _buildPosts(context, posts);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _buildPosts(BuildContext context, List posts) {
  return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index]['body']),
            onTap: () => _navigateToPost(context, posts[index]['id']),
          ),
        );
      });
}

void _navigateToPost(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => SinglePostPage(postId: id)),
  );
}
