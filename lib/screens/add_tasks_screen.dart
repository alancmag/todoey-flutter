import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddTasksScreen extends StatefulWidget {
  final Function addTaskCallback;

  AddTasksScreen(this.addTaskCallback);

  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  String tarefa;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              enabled: true,
              cursorColor: Colors.lightBlueAccent,
              onChanged: (newValue) {
                tarefa = newValue;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                widget.addTaskCallback(tarefa);
              },
            ),
          ],
        ),
      ),
    );
  }
}
