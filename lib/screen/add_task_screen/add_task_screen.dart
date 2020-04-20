import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_yamatatsu/model/task.dart';
import 'package:todo_app_yamatatsu/view_model/task_view_model.dart';

class AddTaskScreen extends StatelessWidget {
  static String id = 'add_task_screen';
  final Task editTask;
  AddTaskScreen({Key key, this.editTask}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, _) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.clear();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(_isEdit() ? 'Save Task' : 'Add Task'),
            ),
            body: ListView(
              children: <Widget>[
                _buildInputField(
                  context,
                  title: 'Name',
                  errorText: viewModel.isValidate
                      ? viewModel.validateTaskString
                      : null,
                  didChanged: (value) {
                    viewModel.setTaskName(value);
                  },
                ),
                _buildInputField(
                  context,
                  title: 'Memo',
                  errorText: null,
                  didChanged: (value) {
                    viewModel.setMemo(value);
                  },
                ),
                _buildAddButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isEdit() {
    return editTask != null;
  }

  void tapAddButton(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context, listen: false);
    viewModel.isValidate = true;
    if (viewModel.validateTaskName()) {
      _isEdit() ? viewModel.updateTask(editTask) : viewModel.addTask();
      Navigator.of(context).pop();
    }
  }

  Widget _buildInputField(BuildContext context,
      {String title, String errorText, Function(String) didChanged}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          ),
          TextField(
            decoration: InputDecoration(errorText: errorText),
            onChanged: (value) {
              didChanged(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: () => tapAddButton(context),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            _isEdit() ? 'Save' : 'Add',
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
