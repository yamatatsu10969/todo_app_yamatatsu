import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_yamatatsu/screen/add_task_screen/add_task_screen.dart';
import 'package:todo_app_yamatatsu/screen/task_screen/task_screen.dart';
import 'package:todo_app_yamatatsu/view_model/task_view_model.dart';

void main() {
  print('Welcome Yamatatsu Todo App !!!');
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MyApp(),
    ),
  );
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
      },
    );
  }
}
