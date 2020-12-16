import 'package:flutter/material.dart';
import 'components/navigationDrawer.dart';
import 'screens/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
class Wrapper extends StatelessWidget {
  final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var user=Provider.of<users>(context);

    bool loggedIn= user !=null;
    print("user  : $user     " );
    if (user == null){
      return onboardingScreen();
    } else {
      return MainWidget();
    }
//    return loggedIn?MainWidget():onboardingScreen();
  }
}
