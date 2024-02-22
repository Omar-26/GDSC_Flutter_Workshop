import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/add_task_page.dart';
import '../screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      home: const HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/addtaskpage': (context) => const AddTaskPage(),
      },
    );
  }
}
