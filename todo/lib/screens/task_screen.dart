import 'package:flutter/material.dart';

List<String> work = [
  'Eat',
  'Walk',
  'Sleep'
]; //declare outside to initialize inside

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: null,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list, //Icon for icon list
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Todo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(
                    '12 Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: ListView(
                  children: [Text('$work')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
