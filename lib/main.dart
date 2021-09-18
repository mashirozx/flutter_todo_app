import 'package:flutter/material.dart';

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
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _inputController = TextEditingController();
  final List<Todo> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo list')),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: _todos.map((Todo todo) {
            return TodoItem(
              todo: todo,
              handleTodoChange: _handleTodoChange,
            );
          }).toList()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _handleDisplayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  void _addTodoItem(String name) {
    if (name.isNotEmpty) {
      setState(() {
        _todos.add(Todo(name: name, checked: false));
      });
    }
    _inputController.clear();
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  Future<void> _handleDisplayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _inputController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_inputController.text);
              },
            ),
          ],
        );
      },
    );
  }
}

/// the todo data interface
class Todo {
  final String name;
  bool checked;

  Todo({required this.name, required this.checked});
}

class TodoItem extends StatelessWidget {
  // const TodoItem({ Key? key }) : super(key: key);

  final Todo todo;
  final Function handleTodoChange;
  // todo: use a hash?
  TodoItem({required this.todo, required this.handleTodoChange})
      : super(key: ObjectKey(todo));

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.white54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        handleTodoChange(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}
