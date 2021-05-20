import 'package:docnews/resources/colors.dart';
import 'package:flutter/material.dart';

import 'package:docnews/screens/home/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocNews',
      theme: ThemeData(
        primaryColor: DocnewsColors.indigo,
        fontFamily: 'IBMPlexSans',
      ),
      home: HomeScreen(),
    );
  }
}
