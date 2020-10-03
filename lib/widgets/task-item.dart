import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class TaskItem extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  TaskItem({this.isChecked, this.taskTitle, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: constPurpleColor,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
