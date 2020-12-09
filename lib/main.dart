import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/screens/home_screen.dart';
import 'utils/constants.dart';
import 'screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool loginState = false;
  getLoginState() {
    prefs.then((value) {
      if(value.getString('uid').isNotEmpty){
        setState(() {
          loginState = true;
        });
      }
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    getLoginState();
  }
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginState ? MainWidget() : onboardingScreen(),
    );
  }
}
