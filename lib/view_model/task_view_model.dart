import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get messages {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task updateTask) {
    var updateIndex = _tasks.indexWhere((task) {
      return task.createdAt == updateTask.createdAt;
    });
    _tasks[updateIndex] = updateTask;
  }
}
