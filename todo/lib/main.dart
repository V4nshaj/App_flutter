import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data_provider/appdata.dart';
import 'package:todo/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
