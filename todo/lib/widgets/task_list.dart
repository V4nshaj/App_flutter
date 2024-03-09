import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:todo/models/task.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TaskTile(),
      TaskTile(),
      TaskTile(),
    ]);
  }
}
