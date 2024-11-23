import 'package:flutter/material.dart';
import 'word_list.dart';
import 'score_page.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int currentWordIndex = 0;
  List<String> guessedLetters = [];
  bool isAnswerCorrect = false;
  bool showCheckButton = true;
  Set<String> selectedLetters = Set();
  int remainingGuesses = 0;
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    guessedLetters = List.filled(getWordLength(), '_');
    selectedLetters = Set();
    isAnswerCorrect = false;
    showCheckButton = true;
    remainingGuesses = getWordLength();
  }

  String getCurrentWord() {
    return words[currentWordIndex];
  }

  int getWordLength() {
    return getCurrentWord().length;
  }

  String getDisplayWord() {
    String word = getCurrentWord();
    String displayWord = '';
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (letter == ' ') {
        displayWord += '  ';
      } else if (guessedLetters[i] == letter.toUpperCase()) {
        displayWord += letter + ' ';
      } else {
        displayWord += '_ ';
      }
    }
    return displayWord.trim();
  }

  void handleLetterSelection(String letter) {
    if (remainingGuesses > 0) {
      setState(() {
        selectedLetters.add(letter);
        bool correctGuess = false;
        for (int i = 0; i < getCurrentWord().length; i++) {
          if (getCurrentWord()[i].toUpperCase() == letter) {
            guessedLetters[i] = letter;
            correctGuess = true;
          }
        }
        if (!correctGuess) {
          remainingGuesses--;
        }
      });
    }
  }

  void checkAnswer() {
    setState(() {
      String word = getCurrentWord();
      String guessedWord = guessedLetters.join('');
      isAnswerCorrect = guessedWord.toUpperCase() == word.toUpperCase();
      if (isAnswerCorrect) {
        correctAnswersCount++; // Increment correct answers count
      }
      showCheckButton = false;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentWordIndex < words.length - 1) {
        currentWordIndex++;
        resetGame();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScorePage(score: correctAnswersCount),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String word = getCurrentWord();
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Picture Game'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                getImageUrlForWord(word),
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                getDisplayWord(),
                style: TextStyle(
                    fontSize: 36, fontFamily: 'Roboto', letterSpacing: 2),
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(26, (index) {
                  String letter = String.fromCharCode(index + 65); // A to Z
                  return ElevatedButton(
                    onPressed: selectedLetters.contains(letter)
                        ? null
                        : () => handleLetterSelection(letter),
                    child: Text(letter,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 247, 90, 213),
                      elevation: 10,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: showCheckButton ? checkAnswer : null,
                child: Text('Check Answer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 238, 200, 118),
                  elevation: 10,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text(currentWordIndex == words.length - 1
                    ? 'Submit'
                    : 'Next Question'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 210, 239, 138),
                  elevation: 10,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Visibility(
                visible: isAnswerCorrect,
                child: Text(
                  'Correct!',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: !isAnswerCorrect && !showCheckButton,
                child: Text(
                  'Incorrect! The correct word was ${getCurrentWord()}',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Remaining Guesses: $remainingGuesses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
