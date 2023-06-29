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
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
              radius: 50.0,
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('images/unnamed.png'),
                ),
              Text('Vanshaj',
              style: TextStyle(
                fontSize: 40.0,
                    fontFamily: 'Pacifico',
                    color:Colors.white,
                fontWeight: FontWeight.bold,// bold text
              ),
              ),
              Text('FLUTTER DEVELOPER',
              style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'SourceSansPro',
              color:Colors.teal.shade100,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,
                        width: 150.0,
                child: Divider(
                  color:Colors.black,
              ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                // child: Padding(
                //   padding: EdgeInsets.all(10.0), -> adds padding
                  child: ListTile(
                    leading: const Icon(
                    // Icons.add_shopping_cart, add cart icon
                    // size: 100.0, -> changes size of icon
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text('+44 123 456',
                      style: TextStyle(
                        color:  Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                      ),),
                  ),
              ),
              Card(//Card doesnt have padding it has padding class
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.email,// leading->Icon
                    color: Colors.teal,
                  ),
                  title: Text('example@email.com',
                      style:  TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                      ),
                  ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
