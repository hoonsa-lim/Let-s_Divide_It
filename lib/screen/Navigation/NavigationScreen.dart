import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:letsdivideit/Util.dart';
import 'package:letsdivideit/screen/Navigation/HomeScreen.dart';
import 'package:letsdivideit/store/StringStore.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final String _TAG = "NavigationScreen";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    printFunction(_TAG, "initState");
  }

  @override
  Widget build(BuildContext context) {
    printFunction(_TAG, "build");

    /**변수 선언**/
    Size windowSize = MediaQuery.of(context).size;
    String appName = Provider.of<StringStore>(context).getAppName;
    List<Widget> _navigationScreenList = [//이런식으로 만들면 계속 생김
      HomeScreen(),
      Text(
        'Music',
        style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
      ),
      Text(
        'Places',
        style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
      ),
      Text(
        'News',
        style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(appName),
      ),

      /**중앙에 들어올 화면**/
      body: Center(
        child: _navigationScreenList.elementAt(_selectedIndex),
      ),
      /**BottomNavigationBar**/
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Music'),
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            title: Text('Places'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('News'),
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
