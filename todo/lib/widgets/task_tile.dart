import 'package:flutter/material.dart';
import 'package:todo/widgets/task_checkbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack});
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
    );
  }
}
