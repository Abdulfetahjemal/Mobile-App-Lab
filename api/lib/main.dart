// Import dart convert to use jsonDecode Function
import 'dart:convert';

import 'package:flutter/material.dart';
// Import http package to make http request
import 'package:http/http.dart' as http;
// Import Detail screen
import 'package:post_app/detailpage.dart';

// Post Model Class
class Post {
  int userId = 0;
  int id = 0;
  String title = "";
  String body = "";
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Fetch from api when widget renders initState function runs when the widget tree initalizes
  @override
  void initState() {
    super.initState();
    // Call Fetch users function [its detfined at the bottom ]
    fetchUsers();
  }

// List of postList variables used to store list of post
  List<Post> postList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Post List'),
        ),
        // ListView is used to display list of elements based on the template provideed
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: postList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.notifications),
                onTap: () {
                  // Push Page when list tile is clicked
                  // Uses Detail's page constructor to pass single post
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(postList[index])));
                },
                // Current post trimmed - maximum of 50 characters
                subtitle: Text(postList[index].body.substring(0, 50)),
                // Current post title
                title: Text(postList[index].title),
              );
            }),
      ),
    );
  }

  fetchUsers() async {
    // Await request and set to response variable - GET REQUEST to  https://jsonplaceholder.typicode.com/posts
    //  If you want to make another request to different url you are supposed to change the URL
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
// Check if the API returned status code 200 [success]
    if (response.statusCode == 200) {
      // Empty post list variable
      postList = [];
      // Convert the data into json usng jsondecode function
      var data = jsonDecode(response.body);
      // Iterate through response data b.c the api returned list of json objects
      for (var post in data) {
        // Declare temp post variable
        var tempPost = Post();
        // get current post uid
        tempPost.userId = post["userId"];
        // get current post id
        tempPost.userId = post["id"];
        // get current post title
        tempPost.title = post["title"];
        // get current post body
        tempPost.body = post["body"];
        // Using add temporary varibale to postList
        // set state function to update the user interface
        setState(() {
          postList.add(tempPost);
        });
      }
    }
  }
}
