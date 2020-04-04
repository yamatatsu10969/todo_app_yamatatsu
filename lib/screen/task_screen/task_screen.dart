import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_yamatatsu/screen/add_task_screen/add_task_screen.dart';
import 'package:todo_app_yamatatsu/screen/task_screen/task_item.dart';
import 'package:todo_app_yamatatsu/view_model/task_view_model.dart';

class TaskScreen extends StatelessWidget {
  static String id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: Scaffold(
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
          child: TaskListView(),
        ),
      ),
    );
  }
}

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(builder: (context, taskViewModel, _) {
      return ListView.separated(
          itemBuilder: (context, index) {
            var task = TaskViewModel.mockTasks[index];
            return TaskItem(
              name: task.name,
              memo: task.memo,
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: TaskViewModel.mockTasks.length);
    });
  }
}
