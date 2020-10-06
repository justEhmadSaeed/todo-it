import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class TaskItem extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function deleteCallback;
  final bool darkTheme;

  TaskItem(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.deleteCallback,
      this.darkTheme});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          color: darkTheme ? Colors.white : Colors.black,
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
