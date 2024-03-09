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
    //Buildcontext contains the information where the parent is in the widget tree
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isDone,
            taskTitle: tasks[index].name,
            checkboxCallBack: (checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}
