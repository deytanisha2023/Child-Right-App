import 'package:flutter/material.dart';
import 'package:kids_right/main.dart';
import 'package:kids_right/quiz_games_page.dart';

class TrueFalseQuizPage4 extends StatefulWidget {
  @override
  _TrueFalseQuizPageState createState() => _TrueFalseQuizPageState();
}

class _TrueFalseQuizPageState extends State<TrueFalseQuizPage4> {
  final List<Map<String, Object>> questions = [
    {
      'question':
          'The Right to Privacy means keeping personal information private.',
      'answer': true,
    },
    {
      'question': 'Online privacy is not part of the Right to Privacy.',
      'answer': false,
    },
    {
      'question':
          'Children should have private spaces to think, learn, and grow.',
      'answer': true,
    },
    {
      'question':
          'Respecting boundaries is not important for the Right to Privacy.',
      'answer': false,
    },
    {
      'question':
          'Conversations with doctors or counsellors should remain private.',
      'answer': true,
    },
  ];

  int currentQuestionIndex = 0;
  bool? selectedAnswer;
  bool answerChecked = false;
  int score = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        answerChecked = false;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreCard(
              score: score,
              onReplay: resetQuiz, onViewScoreCard: () {},
              //onViewScoreCard: viewCombinedScoreCard,
            ),
          ),
        );
      }
    });
  }

  void checkAnswer(bool answer) {
    setState(() {
      answerChecked = true;
      selectedAnswer = answer;
      if (selectedAnswer == questions[currentQuestionIndex]['answer']) {
        score++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswer = null;
      answerChecked = false;
      score = 0;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TrueFalseQuizPage4()),
    );
  }

  /*void viewCombinedScoreCard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CombinedScoreCard(
          quizScore: 5, // Replace with actual quiz score
          trueFalseScore: score,
          userName: 'Any name', // Replace with actual user name
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://tse4.mm.bing.net/th/id/OIP.BkDbHobnKiNWi9ZSvBfqeAAAAA?rs=1&pid=ImgDetMain'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
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
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => checkAnswer(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('True'),
                      ),
                      ElevatedButton(
                        onPressed: () => checkAnswer(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('False'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 138, 195, 236),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Next Question'),
                  ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: answerChecked,
                    child: Text(
                      selectedAnswer == currentQuestion['answer']
                          ? 'Correct!'
                          : 'Wrong!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedAnswer == currentQuestion['answer']
                            ? Colors.green
                            : Colors.red,
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
  final VoidCallback onViewScoreCard;

  const ScoreCard({
    required this.score,
    required this.onReplay,
    required this.onViewScoreCard,
  });

  String getEncouragingComment(int score) {
    if (score == 5) {
      return "Excellent! You're a star!";
    } else if (score >= 3) {
      return "Great job! Keep it up!";
    } else {
      return "Good effort! Keep practicing!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://tse2.mm.bing.net/th/id/OIP.wGfpf-A8WlpiFGaYVJYPkwHaEK?rs=1&pid=ImgDetMain',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
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
                    'Your Score',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$score / 5',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    getEncouragingComment(score),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < score ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                        size: 30,
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: onReplay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Replay'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CircularButtonsApp(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 132, 200, 128),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Back'),
                      ),
                    ],
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
