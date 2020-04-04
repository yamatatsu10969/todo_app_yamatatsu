import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/screen/add_task_screen/add_task_screen.dart';
import 'package:todo_app_yamatatsu/screen/task_screen/task_item.dart';

class TaskScreen extends StatelessWidget {
  static String id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AddTaskScreen.id),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return TaskItem(
                name: 'hogehoge',
                memo:
                    'fugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafugafuga',
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: 10),
      ),
    );
  }
}
