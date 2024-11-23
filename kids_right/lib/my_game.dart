import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
//import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'nextpage.dart';
void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with /*HasTappables*/ TapDetector {
  SpriteComponent girl = SpriteComponent();
  SpriteComponent boy = SpriteComponent();
  SpriteComponent background = SpriteComponent();
  SpriteComponent background2 = SpriteComponent();
  SpriteComponent teacher = SpriteComponent();
  SpriteComponent princi_office = SpriteComponent();
  SpriteComponent prologue = SpriteComponent();
  //NextPageButton nextPageButton;
  final Vector2 buttonSize = Vector2(50.0, 50.0);

  final double characterSize = 200.0;
  bool turnAway = false;
  bool charactersStopped = false;
  int dialogIndex = 0;
  int dialogIndex2 = 0;
  int dialogIndex3 = 0;
  int dialogIndex4 = 0;
  List<String> dialogues = [
    'Student: (frustrated) Can you believe it? ',
    'Student: The principal suspended me for my blog post.',
    'Student: All I did was criticize the \ncondition of the school facilities',
    'Student: and the quality of our classes.',
    'Friend: That’s so unfair!',
    'Friend: You were just expressing your opinion.',
    'Friend: This feels like a violation\n of your right to speak up.',
    'Student: I know, but what can I do?',
    'Student: Should I just apologize and \nhope they reduce my suspension?',
    'Friend: No way. You should stand up for your rights.',
    'Friend: Let\'s talk to a teacher who \nmight understand our side of the story.'
  ];
  List<String> dialogues2 = [
    'Teacher: (listening intently) So, you were suspended for writing ',
    'Teacher: a blog post criticizing the school? ',
    'Student: Yes, they said I was "damaging the school’s reputation." ',
    'Student: But I was just expressing \nmy thoughts on the conditions here.',
    'Teacher: I understand. You have the right to express your opinion,',
    'Teacher: and it\'s important that students \nfeel they can speak up about their concerns.',
    'Teacher: Let\'s talk to the principal together. \nI\'ll support you in presenting your case.'
  ];
  List<String> dialogues3 = [
    'Principal: I understand you’re here to discuss the suspension?',
    'Teacher: Yes, Principal. The student was simply expressing their',
    'Teacher: views on the school\'s facilities and the quality of education. ',
    'Teacher:Suspension seems like a harsh response \nfor exercising their right to free expression.',
    'Student: I wasn’t trying to damage the school’s reputation. ',
    'Student:I just wanted to highlight issues \nthat many of us are concerned about.',
    'Student: I believe my right to express my opinion is important.',
    'Principal: I see. While we do value freedom of expression, ',
    'Principal:we must also consider the \nimpact of such posts on the school\'s image.',
    'Principal: However, I realize that suspension\n might not be the best way to handle this.',
    'Teacher: Perhaps there’s a way to \naddress the student’s concerns constructively',
    'Teacher: without punishing them for speaking up.',
    'Principal: You’re right. Student, I will lift your suspension.',
    'Principal: In return, I’d like you to \nparticipate in a student committee to discuss',
    'Principal: and address the issues you’ve raised.\n This way, your concerns can be heard, ',
    'Principal:and we can work together to improve our school.',
    'Student: Thank you, Principal. \nI appreciate the opportunity to be part of the solution.'
  ];
  List<String> dialogues4 = [
    'Friend: I’m so glad that worked out. You stood up for your rights,',
    'Friend:and now you can help make things better for everyone.',
    'Student: Yeah, I’m relieved. Thanks for your support and',
    'Student: thanks to our teacher for believing in me. ',
    'Student:I’m looking forward to making a real difference.',
    'Teacher: I’m proud of you for standing up and speaking out.',
    'Teacher:This is a great example of how we can \nall work together to improve our school community.'
  ];

  //bool musicPlaying = false;

  late TextPaint dialogTextPaint;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAssets();
    _initializeComponents();
    _initializeTextPaint();
  }

  Future<void> _loadAssets() async {
    background.sprite = await loadSprite('story/background.jpg');
    girl.sprite = await loadSprite('girl.png');
    boy.sprite = await loadSprite('boy.png');
    background2.sprite = await loadSprite('castle.jpg');
    teacher.sprite = await loadSprite('teacher.png');
    princi_office.sprite = await loadSprite('principal_office.jpg');
    prologue.sprite = await loadSprite('prologue1.jpg');
    //nextPageButton.sprite = await loadSprite('next_button.png');
  }

  void _initializeComponents() {
    final screenWidth = size[0];
    final screenHeight = size[1];
    const textBoxHeight = 150;

    background.size = Vector2(screenWidth, screenHeight);

    girl
      ..size = Vector2(characterSize + 25, characterSize + 100)
      ..y = screenHeight - (characterSize + 100) - textBoxHeight
      ..anchor = Anchor.topCenter;

    boy
      ..size = Vector2(characterSize + 25, characterSize + 100)
      ..y = screenHeight - (characterSize + 100) - textBoxHeight
      ..x = screenWidth - characterSize
      ..anchor = Anchor.topCenter;

    add(background);
    add(girl);
    add(boy);
  }

  void _initializeTextPaint() {
    dialogTextPaint = TextPaint(
      style: GoogleFonts.caveat(
        fontSize: 42,
        color: Color.fromARGB(255, 243, 241, 241),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _initializeProPaint() {
    dialogTextPaint = TextPaint(
      style: GoogleFonts.caveat(
        fontSize: 42,
        color: Color.fromARGB(255, 109, 63, 63),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    _updateCharacterPositions(dt);
  }

  void _updateCharacterPositions(double dt) {
    if (!charactersStopped) {
      if (girl.x < size[0] / 2 - 20) {
        girl.x += 50 * dt;
      } else if (!turnAway) {
        turnAway = true;
        if (boy.x > size[0] / 2 - 50) {
          boy.x -= 30 * dt;
        }
      } else {
        charactersStopped = true;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (dialogIndex < dialogues.length) {
      _renderDialog(canvas);
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 < dialogues2.length) {
      _renderDialog2(canvas);
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 >= dialogues2.length &&
        dialogIndex3 < dialogues3.length) {
      _renderDialog3(canvas);
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 >= dialogues2.length &&
        dialogIndex3 >= dialogues3.length &&
        dialogIndex4 < dialogues4.length) {
      _renderDialog4(canvas);
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 >= dialogues2.length &&
        dialogIndex3 >= dialogues3.length &&
        dialogIndex4 >= dialogues4.length) {
      remove(teacher);
      remove(girl);
      remove(boy);
      prologue.size = Vector2(size[0], size[1]);
      add(prologue);
      _initializeProPaint();
      _renderPrologue(canvas);
    }
  }

  void _renderDialog(Canvas canvas) {
    if (dialogIndex < dialogues.length) {
      if (charactersStopped) {
        //_playBackgroundMusic();

        final dialogRect = Rect.fromLTWH(0, size[1] - 150, size[0], 150);
        final dialogPaint = Paint()
          ..color = Color.fromARGB(255, 16, 16, 15).withOpacity(0.7)
          ..style = PaintingStyle.fill;
        canvas.drawRect(dialogRect, dialogPaint);

        dialogTextPaint.render(
            canvas, dialogues[dialogIndex], Vector2(10, size[1] - 140.0));
      }
    }
  }

  Future<void> _switchToSecondBackground() async {
    // Remove old components
    remove(background);
    remove(boy);
    remove(girl); // Remove the old girl component

    // Set the new background
    background2.size = Vector2(size[0], size[1]);
    add(background2);

    // Reinitialize the girl component with new position and properties
    girl = SpriteComponent()
      ..sprite = await loadSprite('newgirl.png')
      ..size = Vector2(characterSize + 25, characterSize + 100)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) + 150
      ..y = size[1] - 350;

    add(girl);
    teacher = SpriteComponent()
      ..sprite = await loadSprite('teacher.png')
      ..size = Vector2(characterSize, characterSize + 200)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2)
      ..y = size[1] - 450;

    add(teacher);
  }

  Future<void> _switchToThirdBackground() async {
    // Remove old components
    remove(background2);
    remove(teacher);
    remove(girl); // Remove the old girl component

    // Set the new background
    princi_office.size = Vector2(size[0], size[1]);
    add(princi_office);

    // Reinitialize the girl component with new position and properties
    girl = SpriteComponent()
      ..sprite = await loadSprite('newgirl.png')
      ..size = Vector2(characterSize + 50, characterSize + 200)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) + 150
      ..y = size[1] - 450;

    add(girl);
    teacher = SpriteComponent()
      ..sprite = await loadSprite('teacher.png')
      ..size = Vector2(characterSize, characterSize + 300)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) + 20
      ..y = size[1] - 550;

    add(teacher);
  }

  Future<void> _switchToForthBackground() async {
    // Remove old components
    remove(princi_office);
    // Remove the old girl component

    // Set the new background
    background.size = Vector2(size[0], size[1]);
    add(background);

    // Reinitialize the girl component with new position and properties
    girl = SpriteComponent()
      ..sprite = await loadSprite('newgirl.png')
      ..size = Vector2(characterSize + 50, characterSize + 200)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) + 120
      ..y = size[1] - 450;

    add(girl);
    boy = SpriteComponent()
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(characterSize + 50, characterSize + 200)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) + 230
      ..y = size[1] - 450;

    add(boy);
    teacher = SpriteComponent()
      ..sprite = await loadSprite('teacher.png')
      ..size = Vector2(characterSize, characterSize + 300)
      ..anchor = Anchor.topCenter
      ..x = (size[0] - size[0] / 2) - 50
      ..y = size[1] - 550;

    add(teacher);
  }

  void _renderDialog2(Canvas canvas) {
    if (dialogIndex2 < dialogues2.length) {
      final dialogRect = Rect.fromLTWH(0, size[1] - 150, size[0], 150);
      final dialogPaint = Paint()
        ..color = Color.fromARGB(255, 16, 16, 15).withOpacity(0.7)
        ..style = PaintingStyle.fill;
      canvas.drawRect(dialogRect, dialogPaint);

      dialogTextPaint.render(
          canvas, dialogues2[dialogIndex2], Vector2(10, size[1] - 140.0));
    }
  }

  void _renderDialog3(Canvas canvas) {
    if (dialogIndex3 < dialogues3.length) {
      final dialogRect = Rect.fromLTWH(0, size[1] - 150, size[0], 150);
      final dialogPaint = Paint()
        ..color = Color.fromARGB(255, 16, 16, 15).withOpacity(0.7)
        ..style = PaintingStyle.fill;
      canvas.drawRect(dialogRect, dialogPaint);

      dialogTextPaint.render(
          canvas, dialogues3[dialogIndex3], Vector2(10, size[1] - 140.0));
    }
  }

  void _renderDialog4(Canvas canvas) {
    if (dialogIndex4 < dialogues4.length) {
      final dialogRect = Rect.fromLTWH(0, size[1] - 150, size[0], 150);
      final dialogPaint = Paint()
        ..color = Color.fromARGB(255, 16, 16, 15).withOpacity(0.7)
        ..style = PaintingStyle.fill;
      canvas.drawRect(dialogRect, dialogPaint);

      dialogTextPaint.render(
          canvas, dialogues4[dialogIndex4], Vector2(10, size[1] - 140.0));
    }
  }

  void _renderPrologue(Canvas canvas) {
    final dialogRect =
        Rect.fromLTWH((size[0] / 2) - 350, (size[1] / 2) - 150, 700, 300);
    final dialogPaint = Paint()
      ..color = Color.fromARGB(255, 236, 236, 226)
      ..style = PaintingStyle.fill;
    canvas.drawRect(dialogRect, dialogPaint);
    dialogTextPaint.render(
        canvas,
        "Epilogue\nThe student’s willingness to stand up for their rights\n and work constructively with the school\n administration led to positive changes in the school.\n This experience taught everyone involved \nthe value of free expression and \ncollaboration in addressing important issues.",
        Vector2(50, size[1] - 140.0));
  }

  /*void _playBackgroundMusic() {
    if (!musicPlaying) {
      FlameAudio.bgm.play('music.ogg');
      musicPlaying = true;
    }
  }*/

  @override
  void onTap() /*onTapDown(int id, TapDownInfo info)*/ {
    super.onTap();
    if (charactersStopped && dialogIndex < dialogues.length) {
      dialogIndex++;
      if (dialogIndex >= dialogues.length) {
        _switchToSecondBackground();
      }
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 < dialogues2.length) {
      dialogIndex2++;
      if (dialogIndex2 >= dialogues2.length) {
        _switchToThirdBackground();
      }
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 >= dialogues2.length &&
        dialogIndex3 < dialogues3.length) {
      dialogIndex3++;
      if (dialogIndex3 >= dialogues3.length) {
        _switchToForthBackground();
      }
    } else if (dialogIndex >= dialogues.length &&
        dialogIndex2 >= dialogues2.length &&
        dialogIndex3 >= dialogues3.length &&
        dialogIndex4 < dialogues4.length) {
      dialogIndex4++;
    }
  }
}
