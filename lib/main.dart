import 'package:flutter/material.dart';
import 'package:todoey_flutter/modals/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        home: TasksScreen(),
      ),
    );
  }
}
