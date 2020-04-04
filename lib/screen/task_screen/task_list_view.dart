import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_yamatatsu/screen/add_task_screen/add_task_screen.dart';
import 'package:todo_app_yamatatsu/screen/task_screen/task_item.dart';
import 'package:todo_app_yamatatsu/view_model/task_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(builder: (context, taskViewModel, _) {
      return ListView.separated(
          itemBuilder: (context, index) {
            var task = taskViewModel.tasks[index];
            return TaskItem(
              task: task,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return AddTaskScreen(editTask: taskViewModel.tasks[index]);
                  }),
                );
              },
              toggleDone: (value) {
                taskViewModel.toggleDone(index, value);
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: taskViewModel.tasks.length);
    });
  }
}
