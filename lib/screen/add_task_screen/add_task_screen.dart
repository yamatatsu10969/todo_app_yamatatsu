import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_yamatatsu/model/task.dart';
import 'package:todo_app_yamatatsu/view_model/task_view_model.dart';

class AddTaskScreen extends StatelessWidget {
  static String id = 'add_task_screen';
  final _formKey = GlobalKey<FormState>();
  final Task editTask;
  AddTaskScreen({Key key, this.editTask}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text((editTask == null) ? 'Add Task' : 'Save Task'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'TaskName',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextFormField(
                        initialValue: (editTask == null) ? '' : editTask.name,
                        autofocus: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter something.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          viewModel.editingName = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Memo',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      TextFormField(
                        initialValue: (editTask == null) ? '' : editTask.name,
                        onSaved: (value) {
                          viewModel.editingMemo = value;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          _buildAddButton(context)
        ],
      ),
    );
  }

  void tapAddButton(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final viewModel = Provider.of<TaskViewModel>(context, listen: false);
      viewModel.addTask();
      Navigator.of(context).pop();
    }
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () => tapAddButton(context),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 60,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            (editTask == null) ? 'Add' : 'Save',
            style:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
