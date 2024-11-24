import 'package:flutter/material.dart';
import 'package:kids_right/true_false/TF4.dart'; // Import the True/False game page

class QuizPage4 extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage4> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'What does the Right to Privacy mean?',
      'options': [
        'a) Keeping personal information private',
        'b) Sharing everything',
        'c) Ignoring privacy',
        'd) Hiding nothing'
      ],
      'answer': 'a) Keeping personal information private'
    },
    {
      'question':
          'Which Article of the Constitution of India includes the Right to Privacy?',
      'options': [
        'a) Article 14',
        'b) Article 19',
        'c) Article 21',
        'd) Article 21A'
      ],
      'answer': 'c) Article 21'
    },
    {
      'question': 'Why is the Right to Privacy important?',
      'options': [
        'a) To feel safe and secure',
        'b) To share everything',
        'c) To avoid privacy',
        'd) To hide nothing'
      ],
      'answer': 'a) To feel safe and secure'
    },
    {
      'question': 'What should you do if your privacy is violated?',
      'options': [
        'a) Stay silent',
        'b) Inform a parent or teacher',
        'c) Ignore it',
        'd) Share everything'
      ],
      'answer': 'b) Inform a parent or teacher'
    },
    {
      'question': 'Which is NOT part of the Right to Privacy?',
      'options': [
        'a) Personal information',
        'b) Online privacy',
        'c) Private spaces',
        'd) Sharing everything'
      ],
      'answer': 'd) Sharing everything'
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
      MaterialPageRoute(builder: (context) => QuizPage4()),
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
                            answerChecked =
                                false; // Reset answer check status when a new option is selected
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                image: NetworkImage(
                    'https://tse2.mm.bing.net/th/id/OIP.wGfpf-A8WlpiFGaYVJYPkwHaEK?rs=1&pid=ImgDetMain'),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          builder: (context) => TrueFalseGamePage4(),
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
      return 'Excellent! You have a great understanding of your rights!';
    } else if (score >= 3) {
      return 'Good job! You have a good understanding of your rights!';
    } else {
      return 'Keep trying! The more you learn about your rights, the better you will understand them!';
    }
  }
}
