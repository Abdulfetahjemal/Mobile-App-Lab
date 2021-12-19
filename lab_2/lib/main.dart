import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("Hello"),
            Text("Hi"),
            Container(
              height: 50,
              width: 50,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
