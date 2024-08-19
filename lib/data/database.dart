import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  late final Box _myBox;

  ToDoDataBase() {
    _myBox = Hive.box('mybox');
  }

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = []; // Initialize with an empty list
    updateDataBase(); // Save initial empty list to the box
  }

  // load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST", defaultValue: []);
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
