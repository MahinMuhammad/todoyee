import 'package:flutter/material.dart';
import 'package:todoyee/util/dialog_button.dart';

class DailogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancle;
  const DailogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  labelText: "Task",
                  hintText: "Add new task",
                  labelStyle: TextStyle(color: Colors.black)),
              cursorColor: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DailogButton(buttonName: "Save", onPressed: onSave),
                DailogButton(buttonName: "Cancel", onPressed: onCancle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
