import 'package:flutter/material.dart';
import 'package:kids_right/onboarding_screen.dart';
import 'package:kids_right/quiz_start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:kids_right/ui/home_page.dart';

/*void main() {
  runApp(MyAppli());
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: MyAppli() //MyApp()
          ));
}

class MyAppli extends StatelessWidget {
  const MyAppli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
