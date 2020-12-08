import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: onboardingScreen(),
    );
  }
}


