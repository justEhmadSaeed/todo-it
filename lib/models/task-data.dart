import 'package:flutter/cupertino.dart';
import "package:flutter/foundation.dart";
import 'package:todo_app/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  TaskData() {
    _readTheme();
    _readTasks();
  }
  List<Task> _tasks = [];
  SharedPreferences prefs;
  bool darkTheme = false;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void toggleDarkTheme() async {
    darkTheme = !darkTheme;
    notifyListeners();
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    prefs.setBool('DARKTHEME_UNIQUE', darkTheme);
  }

  void _readTheme() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    darkTheme = prefs.getBool('DARKTHEME_UNIQUE') ?? false;
    notifyListeners();
  }

  void _writePref(String taskTitle, bool isChecked) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    prefs.setBool(taskTitle, isChecked);
  }

  void _readTasks() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();

    var keys = prefs.getKeys() ?? null;
    keys = keys.where((element) => element != 'DARKTHEME_UNIQUE').toSet();
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
