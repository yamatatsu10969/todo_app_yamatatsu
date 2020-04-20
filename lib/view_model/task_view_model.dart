import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app_yamatatsu/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  String get editingName => nameController.text;
  String get editingMemo => memoController.text;
  TextEditingController nameController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  String _strValidateName = '';
  String get strValidateName => _strValidateName;
  bool _validateName = false;
  bool get validateName => _validateName;

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  bool validateTaskName() {
    if (editingName.isEmpty) {
      _strValidateName = 'Please input something.';
      notifyListeners();
      return false;
    } else {
      _strValidateName = '';
      _validateName = false;
      return true;
    }
  }

  void setValidateName(bool value) {
    _validateName = value;
  }

  void clear() {
    nameController.clear();
    memoController.clear();
    _validateName = false;
    notifyListeners();
  }

  void updateValidateName() {
    if (validateName) {
      validateTaskName();
    }
    notifyListeners();
  }

  void addTask() {
    final newTask = Task(
      name: nameController.text,
      memo: memoController.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _tasks.add(newTask);
    clear();
  }

  void updateTask(Task updateTask) {
    var updateIndex = _tasks.indexWhere((task) {
      return task.createdAt == updateTask.createdAt;
    });
    updateTask.name = nameController.text;
    updateTask.memo = memoController.text;
    updateTask.updatedAt = DateTime.now();
    _tasks[updateIndex] = updateTask;
    clear();
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
}
