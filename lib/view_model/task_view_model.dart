import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  String _editingName = '';
  String get editingName => _editingName;
  String _editingMemo = '';
  String get editingMemo => _editingMemo;
  String _validateTaskString = '';
  String get validateTaskString => _validateTaskString;
  bool isValidate = false;

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  bool validateTaskName() {
    if (editingName.isEmpty) {
      _validateTaskString = 'Please input something.';
      notifyListeners();
      print('😈 so bad ... ');
      return false;
    } else {
      _validateTaskString = '';
      isValidate = false;
      print('🌞 good !!! nice task !');
      return true;
    }
  }

  void clear() {
    _editingName = '';
    _editingMemo = '';
    isValidate = false;
  }

  void setTaskName(String name) {
    _editingName = name;
    if (isValidate) {
      validateTaskName();
    }
    notifyListeners();
  }

  void setMemo(String memo) {
    _editingMemo = memo;
  }

  void addTask() {
    final newTask = Task(
      name: editingName,
      memo: editingMemo,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _tasks.add(newTask);
    clear();
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
    clear();
    notifyListeners();
  }

  void toggleDone(int index, bool isDone) {
    var task = _tasks[index];
    task.isDone = isDone;
    _tasks[index] = task;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
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
