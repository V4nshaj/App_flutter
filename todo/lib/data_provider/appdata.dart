import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class AppData extends ChangeNotifier {
  //any change notifies
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy breads'),
  ];

  void addnewtask(String newTask) {
    _tasks.add(Task(name: newTask)); // Add to internal list
    notifyListeners();
    // TaskList();
  }

  List<Task> get task => _tasks; //public variable access private variable

  void toggleTaskStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void removetask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    // TaskList();
  }
}
