import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 100, width: 100, color: Colors.red),
            Row(
              children: [
                Container(height: 100, width: 100, color: Colors.blue),
                Container(height: 100, width: 100, color: Colors.green)
              ],
            ),
            Container(height: 100, width: 100, color: Colors.brown),
            Row(
              children: [
                Container(height: 100, width: 100, color: Colors.cyan),
                Container(height: 100, width: 100, color: Colors.deepOrange),
                Container(height: 100, width: 100, color: Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
