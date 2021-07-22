import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modals/task_data.dart';
import 'package:todoey_flutter/screens/update_task_screen.dart';
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
            onTapCallback: () => {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => UpdateTaskScreen(index: index),
              )
            },
          );
        },
      );
    });
  }
}
