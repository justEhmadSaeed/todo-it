import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task-item.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task-data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (contex, index) {
          return TaskItem(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                // taskData.toggleCheckBox(index);
              });
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
