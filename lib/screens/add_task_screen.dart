import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modals/task_data.dart';
import 'package:todoey_flutter/wigets/rounded_button.dart';

class AddTaskScreen extends StatelessWidget {
  static String newTaskTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF0B2239),
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RoundedButton(
                    title: 'Add',
                    color: Color(0xFF0B2239),
                    onPressed: () {
                      if (newTaskTitle != '') {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(newTaskTitle);
                        newTaskTitle = '';
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
