import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

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
  final TextEditingController _controller = TextEditingController();

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
        isCompleted: true,
        dueDate: DateTime.now().add(const Duration(days: 2))),
  ];

  // Creating new Task Function
  void _createNewTask(task) {
    final newTask = Task(
      title: task,
      description: 'New task description',
      dueDate: DateTime.now().add(const Duration(days: 1)),
    );

    setState(() {
      print("new");
      _tasks.add(newTask);
    });
  }

  // Deleting Task Function
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  // CheckBox Function
  void _checkboxChanged(bool? value, int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  // Editing Task Function
  void _onEdit(int index) {
    setState(() {
      _controller.text = _tasks[index].title;
    });
    showDialog(context: context, builder: (context) => newTaskDialog(index));
  }

  // Creating and Editing Dialog Screen
  Widget newTaskDialog(int? index) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add New Task",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      hintText: "New Note",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    if (index != null) {
                      setState(() {
                        _tasks[index].title = _controller.text;
                        Navigator.pop(context);
                        _controller.clear();
                      });
                    } else {
                      if (_controller.text.isNotEmpty) {
                        _createNewTask(_controller.text);
                        Navigator.pop(context);
                        _controller.clear();
                      } else {}
                    }
                  }),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
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
            onPressed: () => showDialog(
                context: context, builder: (context) => newTaskDialog(null)),
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
                  ? const Center(
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
                          onDelete: () => _deleteTask(index),
                          onChanged: (p0) => _checkboxChanged(p0, index),
                          onEdit: () => _onEdit(index),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context, builder: (context) => newTaskDialog(null)),
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
  final Function? onEdit;
  final Function(bool?)? onChanged;

  const TaskTile({
    super.key,
    this.taskTitle,
    this.taskDescription,
    this.taskDueDate,
    this.isCompleted,
    this.onDelete,
    this.onEdit,
    required this.onChanged,
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
              activeColor: Colors.transparent,
              value: isCompleted,
              onChanged: onChanged,
            ),
            title: Text(
              taskTitle!,
              style: TextStyle(
                decoration: isCompleted! ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      color: Theme.of(context).accentColor),
                  onSelected: (String value) {
                    switch (value) {
                      case 'edit':
                        onEdit!();
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
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                    const PopupMenuItem(
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
