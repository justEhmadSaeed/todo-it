import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_tasks_screen.dart';
import '../widgets/task-list.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/task-data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constPurpleColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: constPurpleColor,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(
                      addTaskAction: (String newText) {
                        if (newText.isNotEmpty) {
                          // setState(() {
                          // tasks.add(Task(name: newText));
                          // });
                          Navigator.pop(context);
                        }
                      },
                    ));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: constPurpleColor,
                      size: 30,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'To-Do it',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
