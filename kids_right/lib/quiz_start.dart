import 'package:flutter/material.dart';
import 'true_false_game_page.dart'; // Import the True/False game page

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'What does the POCSO Act stand for?',
      'options': [
        'A) Protection of Children from Sexual Offences Act',
        'B) Protection of Children from Social Offences Act',
        'C) Protection of Citizens from Sexual Offences Act',
        'D) Protection of Citizens from Social Offences Act'
      ],
      'answer': 'A) Protection of Children from Sexual Offences Act'
    },
    {
      'question': 'In which year was the POCSO Act introduced in India?',
      'options': ['A) 2010', 'B) 2011', 'C) 2012', 'D) 2013'],
      'answer': 'C) 2012'
    },
    {
      'question': 'According to the POCSO Act, who should a child inform if they experience any uncomfortable touch?',
      'options': [
        'A) A stranger',
        'B) A trusted adult like a parent, teacher, or guardian',
        'C) A friend',
        'D) No one'
      ],
      'answer': 'B) A trusted adult like a parent, teacher, or guardian'
    },
    {
      'question': 'What does the POCSO Act ensure if a child is hurt?',
      'options': [
        'A) The child will be left alone',
        'B) The child will receive help and care, like seeing a doctor and talking to a counsellor',
        'C) The child will be punished',
        'D) The child will be ignored'
      ],
      'answer': 'B) The child will receive help and care, like seeing a doctor and talking to a counsellor'
    },
    {
      'question': 'What is one way a child can stay safe according to the POCSO Act?',
      'options': [
        'A) Keep silent about uncomfortable touches',
        'B) Talk to a trusted adult if they feel uncomfortable',
        'C) Allow anyone to touch them',
        'D) Ignore the situation'
      ],
      'answer': 'B) Talk to a trusted adult if they feel uncomfortable'
    },
  ];

  int currentQuestionIndex = 0;
  String selectedOption = '';
  bool isCorrect = false;
  bool answerChecked = false;
  int score = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedOption = '';
        isCorrect = false;
        answerChecked = false;
      } else {
        // Navigate to the scorecard screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreCard(score: score, onReplay: resetQuiz),
          ),
        );
      }
    });
  }

  void checkAnswer() {
    setState(() {
      answerChecked = true;
      isCorrect = selectedOption == questions[currentQuestionIndex]['answer'];
      if (isCorrect) {
        score++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedOption = '';
      isCorrect = false;
      answerChecked = false;
      score = 0;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => QuizPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final options = currentQuestion['options'] as List<String>;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://tse4.mm.bing.net/th/id/OIP.BkDbHobnKiNWi9ZSvBfqeAAAAA?rs=1&pid=ImgDetMain'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 116, 4, 228).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color.fromARGB(255, 116, 4, 228).withOpacity(0.5),
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
                    currentQuestion['question'] as String,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 1, 63),
                    ),
                  ),
                  SizedBox(height: 20),
                  for (var option in options)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = option;
                            answerChecked = false; // Reset answer check status when a new option is selected
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: selectedOption == option
                                ? Colors.blue.withOpacity(0.5)
                                : Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: checkAnswer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 153, 255, 218),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Check Answer'),
                      ),
                      ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 138, 195, 236),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Next Question'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: answerChecked,
                    child: Text(
                      isCorrect ? 'Correct!' : 'Wrong!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
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

class ScoreCard extends StatelessWidget {
  final int score;
  final VoidCallback onReplay;

  const ScoreCard({required this.score, required this.onReplay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://tse2.mm.bing.net/th/id/OIP.wGfpf-A8WlpiFGaYVJYPkwHaEK?rs=1&pid=ImgDetMain'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
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
                    'Your Score',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$score / 5',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _getEncouragementMessage(score),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: onReplay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Play Again'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrueFalseGamePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('True/False Game'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getEncouragementMessage(int score) {
    if (score == 5) {
      return 'Excellent! You got all the answers correct!';
    } else if (score >= 3) {
      return 'Great job! You got most of the answers right!';
    } else {
      return 'Good effort! Keep practicing and you\'ll get better!';
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

void main() => runApp(MyApp());
