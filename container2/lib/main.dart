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
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            //column has children
            // mainAxisSize: MainAxisSize.min, -> fix the alligned column to  accomodate min space
            // verticalDirection: VerticalDirection.up, -> down to up
            // mainAxisAlignment: MainAxisAlignment.start,-> default starting point
            // mainAxisAlignment: MainAxisAlignment.end, -> to end
            // mainAxisAlignment: MainAxisAlignment.center, -> allings them in center
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly, -> puts even spaces b/w container
            // mainAxisAlignment: MainAxisAlignment.spaceBetween, -> 2 container at corner space b/w
            // crossAxisAlignment: CrossAxisAlignment.end,// aligns at right corner bt as each as width of 100 it cant go right change 1 container to 300
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // stretches all the containers
            children: [
              Container(
                width: double.infinity,
              ),
              Container(
                //container hav only 1 child
                height: 100.0,
                width: 100.0,
                // margin: EdgeInsets.symmetric(vertical: 50.0,
                // horizontal: 10.0), -> top bottom same side
                // margin: EdgeInsets.all(20.0), -> 20 from screen wall
                // margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0), -> for all sides
                // margin: EdgeInsets.only(left:30.0),
                // padding: EdgeInsets.all(20.0),//inside margin
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox( // can give height & width seperates container
                height: 20.0,
              ),
              Container(
                width: 100.0, // width: double.infinity -> stretch the container
                height: 100.0,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
                child: Text('Container 3'),
              ),
            ],
          ),
          // Same can be done for row
        ),
      ),
    );
  }
}
