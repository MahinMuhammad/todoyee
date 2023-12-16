import 'package:flutter/material.dart';

class DailogButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const DailogButton(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName),
    );
  }
}
