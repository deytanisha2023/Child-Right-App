import 'package:flutter/material.dart';
import 'package:kids_right/true_false/TFQ3.dart'; // Import the True/False quiz page

class TrueFalseGamePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'data:image/jpeg;base64,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'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'True/False Game',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrueFalseQuizPage3(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Let\'s Play'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
