import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet/fetch_post.dart';
import 'package:pet/model_post.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<Posts> futurePosts;

  @override
  void initState() {
    super.initState();
    // Fetch posts when the widget is initialized
    futurePosts = fetchPosts(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post View'),
      ),
      body: Center(
        child: FutureBuilder<Posts>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still running, show a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there's an error, display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              // If the Future is complete and the data is available, display the posts
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Post Title: ${snapshot.data?.title ?? "N/A"}'),
                  SizedBox(height: 16),
                  Text('Post Body: ${snapshot.data?.body ?? "N/A"}'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
