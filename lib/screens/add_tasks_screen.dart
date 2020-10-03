import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.addTaskAction});

  final Function addTaskAction;
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        // height: 350,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: constPurpleColor, fontSize: 30),
              ),
              TextField(
                autofocus: true,
                cursorColor: constPurpleColor,
                textAlign: TextAlign.center,
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
                      addTaskAction(newTaskTitle);
                    }),
              )
            ]),
      ),
    );
  }
}
