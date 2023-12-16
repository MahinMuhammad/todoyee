import 'package:flutter/material.dart';
import 'package:todoyee/models/database.dart';
import 'package:todoyee/models/task.dart';
import 'package:todoyee/util/dialog_box.dart';
import 'package:todoyee/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  TodoyeeDatabase db = TodoyeeDatabase();

  final TextEditingController _controller = TextEditingController();

  void cancelPressed() {
    _controller.clear();
    Navigator.pop(context);
  }

  void savedPressed() {
    String name = _controller.text;
    if (name != "") {
      Task task = Task(name, false);
      setState(() {
        db.addToDoList(task);
      });
      _controller.clear();
    }
    Navigator.pop(context);
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DailogBox(
          controller: _controller,
          onCancle: cancelPressed,
          onSave: savedPressed,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.deleteFromToDoList(index);
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.changeToDoStatus(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text(
            "To Do",
            style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 3),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.getTodoList().length,
          itemBuilder: (context, index) {
            return TodoTile(
              task: db.getTodoList()[index],
              onchanged: (value) => checkBoxChanged(value, index),
              onSlide: (context) => deleteTask(index),
            );
          },
        ));
  }
}
