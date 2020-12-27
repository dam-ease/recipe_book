import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';

import 'package:recipe_book/services/dbhelper.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final dbhelper = Databasehelper.instance;
  final textEditingController = TextEditingController();
  bool validated = true;
  String errText = '';
  String todoEdited = '';
  var myItems = List();
  List<Widget> children = new List<Widget>();

  void addTodo() async {
    Map<String, dynamic> row = {Databasehelper.columnName: todoEdited};
    final id = await dbhelper.insert(row);
    Navigator.pop(context);
    todoEdited = '';
    setState(() {
      validated = true;
      errText = '';
    });
  }

  Future<bool> query() async {
    myItems = [];
    children = [];
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      myItems.add(row.toString());
      children.add(
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                row['todo'],
                style: kHintStyle2,
              ),
              onLongPress: () {
                dbhelper.deletedata(row['id']);
                setState(() {});
              },
            ),
          ),
        ),
      );
    });
    return Future.value(true);
  }

  void showalertdialog() {
    textEditingController.text = '';
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Center(child: Text('Add Task')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      todoEdited = value;
                    },
                    decoration: InputDecoration(
                      errorText: validated ? null : errText,
                    ),
                    controller: textEditingController,
                    autofocus: true,
                    style: kWelcome,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.orangeAccent,
                          onPressed: () {
                            if (textEditingController.text.isEmpty) {
                              setState(() {
                                errText = 'Cannot be empty';
                                validated = false;
                              });
                            } else if (textEditingController.text.length >
                                512) {
                              errText = 'Too many characters';
                            } else {
                              addTodo();
                            }
                          },
                          child: Text(
                            'ADD TASK',
                            style: kWelcome.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  // Widget myCard(String task) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     elevation: 5.0,
  //     child: Container(
  //       padding: EdgeInsets.all(5),
  //       child: ListTile(
  //         title: Text(
  //           '$task',
  //           style: kHintStyle2,
  //         ),
  //         onLongPress: () {
  //           print('Will be deleted');
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text('Click on the add button to add your tasks'),
          );
        } else {
          if (myItems.length == 0) {
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: showalertdialog,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
                appBar: AppBar(
                  title: Text(
                    'MY TASKS',
                    style: kWelcome.copyWith(color: Colors.white),
                  ),
                  backgroundColor: Colors.orangeAccent,
                  centerTitle: true,
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: Text('Click the add button to add your tasks'),
                ));
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.orangeAccent,
              ),
              appBar: AppBar(
                title: Text(
                  'MY TASKS',
                  style: kWelcome.copyWith(color: Colors.white),
                ),
                backgroundColor: Colors.orangeAccent,
                centerTitle: true,
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
