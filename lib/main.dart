import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:letsdivideit/screen/Navigation/NavigationScreen.dart';
import 'file:///C:/HoonsaData/Flutter/lets_divide_it/lib/screen/Navigation/HomeScreen.dart';
import 'package:letsdivideit/store/StringStore.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => StringStore()),
      ],
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '나눠서 합시다.',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationScreen(),
      ),
    ),
  );
}
