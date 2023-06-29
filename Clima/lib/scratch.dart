import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  //for waiting for the output asynchronise is used
  task1();
  String task2result = await task2(); //wait for task to complete with await
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  // future means dynamic to wait for future string
  Duration threesec = Duration(seconds: 3);
  // sleep(threesec); synchronous method
  String result;
  await Future.delayed(threesec, () {
    result = 'task 2 data';
    print('Task 2 complete');
  }); //asynchronous method it goes to other task and till the current task completes
  return result;
}

void task3(String task2data) {
  String result = 'task 3 data';
  print('Task 3 completes with $task2data');
}
