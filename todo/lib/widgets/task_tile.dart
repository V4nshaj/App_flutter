import 'package:flutter/material.dart';
import 'package:todo/widgets/task_checkbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  TaskTile({required this.isChecked, required this.taskTitle});
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
          checkboxState: isChecked), //, toggleCheckboxState: isChecked
    );
  }
}

// void checkboxCallBack(bool? checkboxState) {
//   setState(() {
//     isChecked = checkboxState!;
//   });
// }
