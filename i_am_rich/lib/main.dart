//->comments
import 'package:flutter/material.dart';
//The main funcn is the starting point for all our flutter app
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My new App'),),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 55,),
              Text("Hello World"),
              MaterialButton(
                color: Colors.blue,
                onPressed: (){
                print("I have clicked this button");
              },child: Text('Click here'),)
            ],
          ),
        ),
      ),
    ),
  );
}
