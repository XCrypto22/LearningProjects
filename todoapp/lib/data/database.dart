import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/models/task.dart';

class TodoDatabase {
  List<Task> toDoList = [];
  //reference our box
  final _myBox = Hive.box('mybox');

  // method to create initial data
  void createInitialData() {
    toDoList = [
      Task(title: "Create more apps", isCompleted: false),
      Task(title: "Watch Flutter Tutorials", isCompleted: false)
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST", defaultValue: []).cast<Task>();
  }

  // update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }

  void closeHive() {
    Hive.close();
  }
}
