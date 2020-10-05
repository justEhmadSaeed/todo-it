import 'package:flutter/cupertino.dart';
import "package:flutter/foundation.dart";
import 'package:todo_app/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  TaskData() {
    _readPref();
  }
  List<Task> _tasks = [];
  SharedPreferences prefs;

  void _writePref(String taskTitle, bool isChecked) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    prefs.setBool(taskTitle, isChecked);
  }

  void _readPref() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys() ?? null;
    if (keys == null) return;

    for (String key in keys) {
      _tasks.add(Task(name: key, isDone: prefs.get(key)));
    }
    notifyListeners();
  }

  void _deletePref(String title) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();

    prefs.remove(title);
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get taskCount => _tasks.length;

  void addTask(String taskTitle) {
    if (taskTitle?.isEmpty ?? true) return;

    var existingTask = _tasks.firstWhere((element) => element.name == taskTitle,
        orElse: () => null);

    if (existingTask != null) return;

    _tasks.add(Task(name: taskTitle));
    _writePref(taskTitle, false);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _deletePref(task.name);
    notifyListeners();
  }

  void toggleCheckBox(Task task) {
    task.toggleDone();
    _writePref(task.name, task.isDone);
    notifyListeners();
  }
}
