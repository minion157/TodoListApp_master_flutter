import 'dart:collection';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/modals/task.dart';

class TaskData extends ChangeNotifier {
  TaskData() {
    getSavedData();
  }

  void getSavedData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final List<Task> decodedData = decode(pref.getString('saveData')!);
      if (decodedData.isEmpty) {
        print('no data');
        return;
      } else {
        _tasks = decodedData;
        notifyListeners();
      }
    } catch (e) {
      print('patani kya hua');
      print(e);
      return;
    }
  }

  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTitle) async {
    final task = Task(title: newTitle);
    _tasks.add(task);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final saveData = encode(tasks);
    pref.setString('saveData', saveData);
    notifyListeners();
  }

  void updateTask(int index) async {
    _tasks[index].toggleDone();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final saveData = encode(tasks);
    pref.setString('saveData', saveData);
    notifyListeners();
  }

  void deleteTask(int index) async {
    _tasks.remove(tasks[index]);
    SharedPreferences pref = await SharedPreferences.getInstance();
    final saveData = encode(tasks);
    pref.setString('saveData', saveData);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
      );
  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item))
          .toList();
}
