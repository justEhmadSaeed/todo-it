import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  TaskItem({this.taskName, this.isTaskCompleted});

  final String taskName;
  final bool isTaskCompleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskName,
          style: TextStyle(
            fontSize: 18,
            decoration: isTaskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(value: false, onChanged: null));
  }
}
