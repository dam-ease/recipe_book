import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/task_data.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
