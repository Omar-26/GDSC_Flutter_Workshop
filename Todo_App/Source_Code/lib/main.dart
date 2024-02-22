import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/screens/add_task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: tdbgColor));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: AddTaskPage(),
    );
  }
}
