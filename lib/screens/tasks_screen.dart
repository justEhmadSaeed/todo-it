import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_tasks_screen.dart';
import '../widgets/task-list.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/models/task-data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool darkTheme = Provider.of<TaskData>(context).darkTheme;
    return Scaffold(
      backgroundColor: constPurpleColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: constPurpleColor,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor:
                    darkTheme ? Color(0xFF1B1B1B) : Color(0xFF757575),
                context: context,
                builder: (context) => AddTaskScreen());
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .toggleDarkTheme();
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        color: darkTheme ? Colors.white : constPurpleColor,
                        size: 30,
                      ),
                      backgroundColor:
                          darkTheme ? constgreyColor : Colors.white,
                      radius: 30,
                    ),
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
                  color: darkTheme ? constgreyColor : Colors.white,
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
