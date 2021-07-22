import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;
  final Function onTapCallback;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.longPressCallback,
      required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTapCallback.call(),
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
