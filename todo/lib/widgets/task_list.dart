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
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
      TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
      TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
    ]);
  }
}
