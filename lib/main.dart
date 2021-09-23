import 'package:flutter/material.dart';

// import 'pages/todo_list.dart';
// import 'pages/router_test.dart';
import 'pages/progress_bar.dart';

void main() {
  return runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      // home: const TodoList(),
      // home: const RouterTestRoute(),
      home: const ProgressRoute(),
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
    );
  }
}
