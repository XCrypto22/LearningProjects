import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/utils/tasktile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final _myBox = Hive.box('mybox');

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if opening the app for the first time
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // if there's already existing data
      db.loadData();
    }
    super.initState();
  }

  @override
  void dispose() {
    // Close the box when the widget is removed from the tree
    _myBox.close();
    db.closeHive();
    super.dispose();
  }

  // text controller
  final TextEditingController _controller = TextEditingController();

  // list of todo tasks

  // create task
  void _createNewTask(task) {
    final newTask = Task(title: task, isCompleted: false);

    setState(() {
      print("new");
      db.toDoList.add(newTask);
    });

    db.updateDatabase();
  }

  // delete task
  void _deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  // CheckBox Function
  void _checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index].isCompleted = !db.toDoList[index].isCompleted;
    });

    db.updateDatabase();
  }

  // edit task
  void _onEdit(int index) {
    setState(() {
      _controller.text = db.toDoList[index].title;
    });
    showDialog(
        context: context, builder: (context) => newTaskDialog(index, "Edit"));
  }

  // Creating and Editing Dialog Screen
  Widget newTaskDialog(int? index, String option) {
    return Dialog(
      backgroundColor: Colors.orange,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.orange),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$option Task",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade800,
                          offset: Offset(0, 5),
                          blurRadius: 10)
                    ]),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                      hintText: "New Note",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                )),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (() {
                    _controller.clear();
                    Navigator.pop(context);
                  }),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 4),
                              blurRadius: 6)
                        ]),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    if (index != null) {
                      setState(() {
                        db.toDoList[index].title = _controller.text;
                        _controller.clear();
                        db.updateDatabase();
                        Navigator.pop(context);
                      });
                    } else {
                      if (_controller.text.isNotEmpty) {
                        _createNewTask(_controller.text);
                        _controller.clear();
                        Navigator.pop(context);
                      } else {}
                    }
                  }),
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 4),
                              blurRadius: 6)
                        ]),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 18),
                      ),
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
        title: const Text('My Todo App'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              child: db.toDoList.isEmpty // check if task list is empty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/animations/empty.json",
                              height: 100),
                          const Text("No tasks at the moment")
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 20.0),
                      itemCount: db.toDoList.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          taskTitle: db.toDoList[index].title,
                          isCompleted: db.toDoList[index].isCompleted,
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
        backgroundColor: Colors.orange,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => newTaskDialog(null, "Add New")),
        child: const Icon(Icons.add),
      ),
    );
  }
}
