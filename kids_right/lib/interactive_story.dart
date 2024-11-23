import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kids_right/my_game.dart';
import 'quiz_games_page.dart'; // Import the Quiz Games Page
import 'puzzle_games_page.dart'; // Import the Puzzle Games Page

import 'custom_button.dart'; // Import the Custom Button

class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Story'),
        backgroundColor: Colors.teal, // Customize as needed
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomButton(
            text: 'Right To Express',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameWidget(game: MyGame()),
                ),
              );
            },
            gradientStartColor: Color(0xFF6DD5FA),
            gradientEndColor: Color(0xFF2980B9),
          ),
          SizedBox(height: 20),
          CustomButton(
            text: 'Right To Identity',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HangmanApp()),
              );
            },
            gradientStartColor: Color(0xFFFC5C7D),
            gradientEndColor: Color(0xFF6A82FB),
          ),
        ],
      ),
    );
  }
}
