import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF1E1E1E),
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [
    Task(
        title: 'Task 1',
        description: 'This is the first task',
        dueDate: DateTime.now()),
    Task(
        title: 'Task 2',
        description: 'This is the second task',
        dueDate: DateTime.now().add(const Duration(days: 1))),
    Task(
        title: 'Task 3',
        description: 'This is the third task',
        dueDate: DateTime.now().add(const Duration(days: 2))),
  ];

  void _createNewTask() {
    int id = _tasks.length;
    final newTask = Task(
      title: 'Task ${id + 1}',
      description: 'New task description',
      dueDate: DateTime.now().add(const Duration(days: 1)),
    );

    setState(() {
      print("new");
      _tasks.add(newTask);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('My Todo App'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle add task action
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: _tasks.isEmpty
                  ? Center(
                      child: Text("No Tasks"),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 20.0),
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                            taskTitle: _tasks[index].title,
                            taskDescription: _tasks[index].description,
                            taskDueDate: _tasks[index].dueDate,
                            isCompleted: _tasks[index].isCompleted,
                            onDelete: () => _deleteTask(index));
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Container(
                    child: Column(
                      children: [Text("Add New Task")],
                    ),
                  ),
                )),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final String? taskDescription;
  final DateTime? taskDueDate;
  final bool? isCompleted;
  final Function? onDelete;

  const TaskTile({
    super.key,
    this.taskTitle,
    this.taskDescription,
    this.taskDueDate,
    this.isCompleted,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(31, 255, 255, 255),
            offset: Offset(0, 2),
            blurRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 255, 0, 85),
            const Color.fromARGB(255, 0, 140, 255).withOpacity(0.5)
          ],
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              width: 2.0,
              color: Colors.transparent,
            ),
          ),
          child: ListTile(
            leading: Checkbox(
                activeColor: Theme.of(context).accentColor,
                value: isCompleted,
                onChanged: ((value) {})),
            title: Text(
              taskTitle!,
              style: TextStyle(
                decoration: isCompleted! ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  DateFormat.yMMMd().format(taskDueDate!),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(width: 10),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      color: Theme.of(context).accentColor),
                  onSelected: (String value) {
                    switch (value) {
                      case 'edit':
                        () {};
                        break;
                      case 'delete':
                        onDelete!();

                        break;
                      case 'share':
                        () {};
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                    PopupMenuItem(
                      value: 'share',
                      child: Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
