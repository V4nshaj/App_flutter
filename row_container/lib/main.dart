import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
          backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100.0,
                  color: Colors.red),
              Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[Container(width: 100.0, height: 100,
                  color:  Colors.yellow,),
                Container(width: 100.0, height: 100,
                  color:  Colors.green,),],
              ),),
              Container(width: 100.0,
                  color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
