import 'package:flutter/cupertino.dart';
import "package:flutter/foundation.dart";
import 'package:todo_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Books'),
  ];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get taskCount => _tasks.length;

  void addTask(String taskTitle) {
    if (taskTitle?.isEmpty ?? true) return;

    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void toggleCheckBox(task) {
    task.toggleDone();
    notifyListeners();
  }
}
