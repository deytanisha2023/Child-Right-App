import 'package:flutter/material.dart';
import 'quiz_pages/quiz_page1.dart';
import 'quiz_pages/quiz_page2.dart';
import 'quiz_pages/quiz_page3.dart';
import 'quiz_pages/quiz_page4.dart';

/*void main() {
  runApp(CircularButtonsApp());
}*/

class CircularButtonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/quiz1': (context) => MyApp1(),
        '/quiz2': (context) => MyApp2(),
        '/quiz3': (context) => MyApp3(),
        '/quiz4': (context) => MyApp4(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> buttons = [
    {
      "icon": "balance",
      "label": "Right to Be Treated Fairly",
      "route": "/quiz1"
    },
    {
      "icon": "speaker_notes",
      "label": "Right to Freedom of Expression",
      "route": "/quiz2"
    },
    {"icon": "fingerprint", "label": "Right to Identity", "route": "/quiz3"},
    {"icon": "lock", "label": "Right to Privacy", "route": "/quiz4"},
  ];

  final List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Color.fromARGB(255, 228, 74, 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 229, 90),
              Color.fromARGB(255, 202, 55, 228)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Learn About Children Rights',
              style: TextStyle(
                fontFamily: 'Algerian',
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(1.0),
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    final button = buttons[index];
                    final color = colors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, button["route"]!);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [color.withOpacity(0.6), color],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                _getIconData(button["icon"]!),
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            button["label"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black54,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black45,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case "balance":
        return Icons.balance;
      case "speaker_notes":
        return Icons.speaker_notes;
      case "fingerprint":
        return Icons.fingerprint;
      case "lock":
        return Icons.lock;
      default:
        return Icons.help;
    }
  }
}
