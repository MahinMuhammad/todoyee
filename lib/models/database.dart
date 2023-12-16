import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoyee/constants/constants.dart';
import 'package:todoyee/models/task.dart';

class TodoyeeDatabase {
  //reference the box
  final _todoyeeBox = Hive.box(K.hiveBoxName);

  List _toDoList = [];

  //load the data from the database
  void loadData() {
    if (_todoyeeBox.get(K.todoListKey) != null) {
      _toDoList = _todoyeeBox.get(K.todoListKey);
    }
  }

  //update the database
  void _updateDatabase() {
    _todoyeeBox.put(K.todoListKey, _toDoList);
  }

  //crud list
  List getTodoList() {
    return _toDoList;
  }

  void addToDoList(Task task) {
    _toDoList.add(task);
    _updateDatabase();
  }

  void deleteFromToDoList(int index) {
    _toDoList.removeAt(index);
    _updateDatabase();
  }

  void changeToDoStatus(int index) {
    _toDoList[index].isCompleted = !_toDoList[index].isCompleted;
    _updateDatabase();
  }
}
