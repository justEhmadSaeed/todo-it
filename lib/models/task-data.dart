import 'package:flutter/cupertino.dart';
import "package:flutter/foundation.dart";
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Books'),
  ];

  int get taskCount => tasks.length;

  void toggleCheckBox(index) {
    tasks[index].toggleDone();
    notifyListeners();
  }
}
