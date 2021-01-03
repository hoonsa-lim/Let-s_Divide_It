import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoItem extends StatefulWidget {
  int pkNum;
  String title;
  int achievementDegree;
  
  TodoItem({
    this.pkNum,
    this.title,
    this.achievementDegree});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {

    Size windowSize = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: windowSize.width * 0.3,
        height: windowSize.width * 0.3,
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}
