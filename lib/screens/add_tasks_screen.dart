import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/task-data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    bool darkTheme = Provider.of<TaskData>(context).darkTheme;

    return Container(
      color: darkTheme ? Color(0xFF1B1B1B) : Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: darkTheme ? constgreyColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        // height: 350,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: darkTheme ? Colors.white : constPurpleColor,
                    fontSize: 30),
              ),
              TextField(
                autofocus: true,
                cursorColor: darkTheme ? Colors.white : constPurpleColor,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: darkTheme ? Colors.white : Colors.black),
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: FlatButton(
                    color: constPurpleColor,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTaskTitle);
                      Navigator.pop(context);
                    }),
              )
            ]),
      ),
    );
  }
}
