import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task(
        title: 'Task 1',
        description: 'This is the first task',
        dueDate: DateTime.now()),
    Task(
        title: 'Task 2',
        description: 'This is the second task',
        dueDate: DateTime.now().add(Duration(days: 1))),
    Task(
        title: 'Task 3',
        description: 'This is the third task',
        dueDate: DateTime.now().add(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            trailing: Text(tasks[index].dueDate.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the add task screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
