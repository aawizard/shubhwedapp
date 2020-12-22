import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/services/auth.dart';
import 'wrapper.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
//    getLoginState();
  }
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value:
//        AuthService().user,
        FirebaseAuth.instance.authStateChanges(),
),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}
