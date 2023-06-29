import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            AppBar(title: Text('I am Poor'), backgroundColor: Colors.blue[999]),
        body: Center(
          child: Image(
            image: AssetImage('images/earth.jpg'),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
    ),
  );
}
