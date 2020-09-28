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
      trailing: TaskCheckbox(),
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  @override
  _TaskCheckboxState createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  bool isTaskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isTaskCompleted,
      activeColor: Colors.lightBlueAccent,
      onChanged: (newValue) {
        setState(() {
          isTaskCompleted = newValue;
        });
      },
    );
  }
}
