import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoyee/models/task.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.task,
      required this.onchanged,
      required this.onSlide});

  final Function(BuildContext)? onSlide;
  final Task task;
  final Function(bool?)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: onSlide,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                task.taskName,
                style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
