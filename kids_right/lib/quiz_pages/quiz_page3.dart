import 'package:flutter/material.dart';
import 'quiz_start3.dart';

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage1(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 241, 231, 134), const Color.fromARGB(255, 223, 151, 236)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage3()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 220, 207, 207),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Stack(
              children: [
                // Shadow
                Text(
                  "Let's Play The Quiz Game",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black.withOpacity(0.5),
                  ),
                ),
                // Foreground text
                Text(
                  "Let's Play The Quiz Game",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(232, 29, 2, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
