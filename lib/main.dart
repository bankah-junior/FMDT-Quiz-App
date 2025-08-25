import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fmdt_quiz_app/providers/difficulty_provider.dart';
import 'package:fmdt_quiz_app/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DifficultyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzia',
      home: const SplashScreen(),
    );
  }
}
