import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data_provider/appdata.dart';
import 'package:todo/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    //Buildcontext contains the information where the parent is in the widget tree
    return Consumer<AppData>(
      builder: (context, provider, child) {
        //cosumer extends appdata it listens data in provider and tells to rebuild the data inside consumer
        //provider access values, fuction, variable
        //child helps to access widgets dont need to be rebuild
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: provider.task[index].isDone,
              taskTitle: provider.task[index].name,
              checkboxCallBack: (checkboxState) {
                print(provider.task[index].name);
                provider.toggleTaskStatus(index);
              },
              onDelete: () {
                var provider = Provider.of<AppData>(context, listen: false);
                provider.removetask(index);
              },
            );
          },
          itemCount: provider.task.length,
        );
      },
    );
  }
}
