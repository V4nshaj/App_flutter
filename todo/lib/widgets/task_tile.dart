import 'package:flutter/material.dart';
import 'package:todo/widgets/task_checkbox.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TasktileState();
}

class _TasktileState extends State<TaskTile> {
  bool isChecked = false;
  void checkboxCallBack(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: isChecked
            ? TextStyle(
                // Apply strikethrough when checked
                decoration: TextDecoration.lineThrough,
              )
            : null, // No style applied when unchecked
      ),
      trailing: TaskCheckBox(
          checkboxState: isChecked, toggleCheckboxState: checkboxCallBack),
    );
  }
}
