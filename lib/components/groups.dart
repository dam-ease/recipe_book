import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  List<String> groups = [
    "Meals of the Day",
    "Healthy Meals",
    "Diet Meals",
    "Around the World"
  ];
  int selectedGroup = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: groups.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedGroup = index;
                  print(index);
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: selectedGroup == index
                        ? Color(0xFFEFF3EE)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  groups[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedGroup == index
                          ? Colors.black
                          : Color(0xFFC2C2B5)),
                ),
              ),
            );
          }),
    );
  }
}
