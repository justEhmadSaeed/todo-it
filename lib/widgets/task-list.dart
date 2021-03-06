import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task-item.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task-data.dart';
import 'package:todo_app/widgets/alert-dialog.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (contex, index) {
          final currentTask = taskData.tasks[index];
          return TaskItem(
            taskTitle: currentTask.name,
            isChecked: currentTask.isDone,
            darkTheme: taskData.darkTheme,
            checkboxCallback: (checkboxState) {
              taskData.toggleCheckBox(currentTask);
            },
            deleteCallback: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDeleteDialog(currentTask);
                }),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
