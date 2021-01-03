import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letsdivideit/Util.dart';
import 'package:letsdivideit/component/Home/TodoItem.dart';
import 'package:letsdivideit/store/StringStore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // 나중에 서버에서 받아올 데이터
  List<Map<String, dynamic>> todoList = [
    {
      "pkNum" : 0,
      "title" : "설거지",
      "achievementDegree" : 100,
    },
    {
      "pkNum" : 1,
      "title" : "청소기",
      "achievementDegree" : 100,
    },
    {
      "pkNum" : 2,
      "title" : "빨래 건조",
      "achievementDegree" : 0,
    },
    {
      "pkNum" : 3,
      "title" : "분리수거",
      "achievementDegree" : 0,
    },
    {
      "pkNum" : 4,
      "title" : "걸레질",
      "achievementDegree" : 0,
    },
    {
      "pkNum" : 5,
      "title" : "아침 식사 준비",
      "achievementDegree" : 0,
    },
    {
      "pkNum" : 6,
      "title" : "화장실 곰팡이 제거",
      "achievementDegree" : 0,
    },
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _TAG = "HomeScreen";
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    printFunction(_TAG, "initState");
  }

  @override void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    printFunction(_TAG, "build");

    //변수 선언
    Size windowSize = MediaQuery.of(context).size;
    String appName = Provider.of<StringStore>(context).getAppName;



    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Row(
              children: [
                Container(
                  color: Colors.lightBlue,
                  width: windowSize.width * 0.75,
                  height: windowSize.height,
                  child: Center(child: Text("hahaha")),
                ),
                Container(
//                  color: Colors.orange,
                  width: windowSize.width * 0.25,
                  height: windowSize.height,
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: widget.todoList.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        pkNum: widget.todoList[index]["pkNum"],
                        title: widget.todoList[index]["title"],
                        achievementDegree: widget.todoList[index]["achievementDegree"],
                      );
                    },
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
