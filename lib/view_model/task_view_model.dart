import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  var editingName = '';
  var editingMemo = '';
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask() {
    final newTask = Task(
      name: editingName,
      memo: editingMemo,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task updateTask) {
    var updateIndex = _tasks.indexWhere((task) {
      return task.createdAt == updateTask.createdAt;
    });
    updateTask.name = editingName;
    updateTask.memo = editingMemo;
    updateTask.updatedAt = DateTime.now();
    _tasks[updateIndex] = updateTask;
  }

  // MARK: mock
  static List<Task> mockTasks = [
    Task(
        name: 'Buy mac book',
        memo: 'Too expensive ...',
        createdAt: DateTime.now().subtract(new Duration(days: 50)),
        updatedAt: DateTime.now()),
    Task(
        name: 'Buy mac book',
        memo: 'Too expensive ...',
        createdAt: DateTime.now().subtract(new Duration(days: 50)),
        updatedAt: DateTime.now()),
    Task(
        name: 'Buy mac book',
        memo: 'Too expensive ...',
        createdAt: DateTime.now().subtract(new Duration(days: 50)),
        updatedAt: DateTime.now()),
    Task(
        name: 'Buy mac book',
        memo: 'Too expensive ...',
        createdAt: DateTime.now().subtract(new Duration(days: 50)),
        updatedAt: DateTime.now()),
  ];
}
