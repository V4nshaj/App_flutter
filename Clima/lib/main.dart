import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

/*  API is set of commands, funcn, protocols, obj that programmers
can use to create software or interact with external system
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
