import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task-item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      TaskItem(taskName: 'Buy Milk', isTaskCompleted: false),
      TaskItem(taskName: 'Buy Milk', isTaskCompleted: false),
      TaskItem(taskName: 'Buy Milk', isTaskCompleted: false),
    ]);
  }
}
