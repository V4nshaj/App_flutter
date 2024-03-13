import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data_provider/appdata.dart';
import 'package:todo/widgets/task_checkbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final VoidCallback onDelete;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: isChecked
            ? TextStyle(
                // Apply strikethrough when checked
                decoration: TextDecoration.lineThrough,
              )
            : null, // No style applied when unchecked
      ),
      trailing: TaskCheckBox(
          checkboxState: isChecked,
          toggleCheckboxState:
              checkboxCallBack), //, toggleCheckboxState: isChecked
      leading: IconButton(
          onPressed: () {
            onDelete();
          },
          icon: Icon(Icons.delete)),
    );
  }
}
