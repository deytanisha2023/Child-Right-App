import 'package:flutter/material.dart';
import 'package:kids_right/home_page1.dart';

//import 'home_page.dart';
/*
void main() {
  runApp(HangmanApp());
}
*/
class HangmanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Picture Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
          ),
          titleLarge: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
