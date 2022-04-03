import 'package:flutter/material.dart';

import 'main.dart';

class DetailScreen extends StatelessWidget {
  // Class memeber varibale
  Post currentPost;
  // Constructor that initalizes currentPost
  DetailScreen(this.currentPost, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              currentPost.title,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(currentPost.body),
          ],
        ),
      ),
    );
  }
}
