import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task-data.dart';
import 'package:todo_app/constants.dart';

class AlertDeleteDialog extends StatelessWidget {
  AlertDeleteDialog(this.task);

  final task;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm?'),
      content: Text(
        'Are you sure you want to delete this?',
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: constPurpleColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "Delete",
            style: TextStyle(color: Colors.redAccent[700]),
          ),
          onPressed: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(task);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
