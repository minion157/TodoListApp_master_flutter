import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => longPressCallback.call(),
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) => checkboxCallback.call(),
      ),
    );
  }
}
