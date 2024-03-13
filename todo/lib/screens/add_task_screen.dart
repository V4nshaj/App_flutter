import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data_provider/appdata.dart';
import 'package:todo/widgets/task_list.dart';
import 'package:todo/widgets/add_button.dart';
//stateless: full widget rerender, statefull:only renders

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<String> _tasks = [];
  late TextEditingController _taskController; //controller for
  final taskListState = TaskListState();
  @override
  void initState() {
    //state is called at the beginnning
    _taskController = TextEditingController();
    super.initState();
    /*taskController.addListener(
      //to take userinput
      () {
        print(taskController.text);
      },
    );*/
    print("init state called");
  }

  void _addTask() {
    String newTask = _taskController.text.trim(); // Get the entered text
    if (newTask.isNotEmpty) {
      // Check if the text is not empty
      var provider = Provider.of<AppData>(context,
          listen:
              false); //same as consumer if listen true but it likes a setstate when add anything the listetner changes to true to rebuild
      provider.addnewtask(newTask);
      _taskController.clear(); // Clear the text field
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Add Task",
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 40.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  autofocus:
                      true, //as soon as the taskfield opens it opens the keyboard without clicking on the textfield
                  textAlign: TextAlign.center,
                  controller: _taskController,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 5.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.lightBlueAccent, width: 5.0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 5.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 2.0)),
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              add_button(onTaskAdded: _addTask),
            ],
          )),
    );
  }
}
