import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  static String id = 'add_task_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
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
                TextField(),
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
                TextField(),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => tapAddButton(context),
            child: Container(
              margin: EdgeInsets.all(20),
              height: 60,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void tapAddButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
