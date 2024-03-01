import 'package:flutter/material.dart';

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

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) toggleCheckboxState;

  TaskCheckBox(
      {required this.checkboxState, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
