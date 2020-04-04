import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String name;
  final String memo;

  const TaskItem({Key key, @required this.name, @required this.memo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  memo,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
//          Spacer(),
          Checkbox(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.lightGreen,
          )
        ],
      ),
    );
  }
}
