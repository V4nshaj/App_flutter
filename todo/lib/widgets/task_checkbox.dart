import 'package:flutter/material.dart';

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) toggleCheckboxState;

  TaskCheckBox(
      {required this.checkboxState, required this.toggleCheckboxState}); //,
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,

      // onChanged: toggleCheckboxState,
    );
  }
}
