import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/screen/add_task_screen.dart';
import 'package:todo_app_yamatatsu/screen/task_screen.dart';

void main() {
  print('Welcome Yamatatsu Todo App !!!');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Yamatatsu TODO',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        initialRoute: TaskScreen.id,
        routes: {
          TaskScreen.id: (context) => TaskScreen(),
          AddTaskScreen.id: (context) => AddTaskScreen(),
        });
  }
}
