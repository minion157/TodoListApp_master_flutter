import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modals/task_data.dart';
import 'package:todoey_flutter/wigets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.title,
            isChecked: task.isDone,
            checkboxCallback: () => taskData.updateTask(index),
            longPressCallback: () => taskData.deleteTask(index),
          );
        },
      );
    });
  }
}
