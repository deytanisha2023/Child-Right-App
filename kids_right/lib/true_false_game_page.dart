import 'package:flutter/material.dart';

class TrueFalseQuizPage extends StatefulWidget {
  @override
  _TrueFalseQuizPageState createState() => _TrueFalseQuizPageState();
}

class _TrueFalseQuizPageState extends State<TrueFalseQuizPage> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'The POCSO Act stands for Protection of Children from Sexual Offences Act.',
      'answer': true,
    },
    {
      'question': 'The POCSO Act was introduced in India in 2011.',
      'answer': false,
    },
    {
      'question': 'A child should inform a trusted adult like a parent, teacher, or guardian if they experience any uncomfortable touch.',
      'answer': true,
    },
    {
      'question': 'The POCSO Act ensures that a child will receive help and care if they are hurt.',
      'answer': true,
    },
    {
      'question': 'According to the POCSO Act, children should keep silent about uncomfortable touches.',
      'answer': false,
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
              onReplay: resetQuiz,
              onViewScoreCard: viewCombinedScoreCard,
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
      MaterialPageRoute(builder: (context) => TrueFalseQuizPage()),
    );
  }

  void viewCombinedScoreCard() {
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
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://tse3.mm.bing.net/th/id/OIP.KL60wksToXiwbnBJZk-r-wHaFL?w=224&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7'),
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
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      selectedAnswer == currentQuestion['answer'] ? 'Correct!' : 'Wrong!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedAnswer == currentQuestion['answer'] ? Colors.green : Colors.red,
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
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Replay'),
                      ),
                      ElevatedButton(
                        onPressed: onViewScoreCard,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('View Scorecard'),
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
class CombinedScoreCard extends StatelessWidget {
  final int quizScore;
  final int trueFalseScore;
  final String userName;

  const CombinedScoreCard({
    required this.quizScore,
    required this.trueFalseScore,
    required this.userName,
  });

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
                    'Combined Scorecard',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Game Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Score', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Badge', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userName),
                      Text('Quiz Questions'),
                      Text('$quizScore / 5'),
                      Image.network('https://tse3.mm.bing.net/th/id/OIP.AlQIOstcVtT2lU-kW0gylwHaKu?w=147&h=213&c=7&r=0&o=5&dpr=1.5&pid=1.7', width: 50, height: 50),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userName),
                      Text('True/False Questions'),
                      Text('$trueFalseScore / 5'),
                      Image.network('https://tse4.mm.bing.net/th/id/OIP.snifZg-qFB-heNqvdv2rnAHaLk?w=138&h=216&c=7&r=0&o=5&dpr=1.5&pid=1.7', width: 50, height: 50),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Back'),
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
