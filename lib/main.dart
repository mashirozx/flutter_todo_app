import 'package:flutter/material.dart';

import 'pages/todo_list.dart';
import 'pages/tips.dart';

void main() {
  return runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: const TodoList(),
      // home: const RouterTestRoute(),
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TipRoute(
                  text: "I'm a router parameter",
                );
              },
            ),
          );
          assert(false, "router return value: $result");
        },
        child: const Text("open tip"),
      ),
    );
  }
}
