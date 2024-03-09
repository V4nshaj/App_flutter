import 'package:flutter/material.dart';
import 'package:todo/screens/add_task_screen.dart';

class add_button extends StatelessWidget {
  final Function onTaskAdded; // Callback function to pass added task

  const add_button({required this.onTaskAdded});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //creates clickable areas i.e increases to touch area
      onTap: () {
        onPressed:
        onTaskAdded;
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, //screen size 80 % width
        height: MediaQuery.of(context).size.height * 0.06,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
