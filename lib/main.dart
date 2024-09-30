import 'package:flutter/material.dart';
import 'package:quizz_application/view/questions_screen/questions_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionsScreen(),
    );
  }
}
