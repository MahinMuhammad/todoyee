import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoyee/constants/constants.dart';
import 'package:todoyee/models/task.dart';
import 'package:todoyee/pages/home_page.dart';

void main() async {
  //initialized hive
  await Hive.initFlutter();

  //register task hive class
  Hive.registerAdapter<Task>(TaskAdapter());

  //open a box
  var _ = await Hive.openBox(K.hiveBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: false,
      ),
    );
  }
}
