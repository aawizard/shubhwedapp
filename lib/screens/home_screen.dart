import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:shubhwed/utils/constants.dart';
import '../utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';
import 'package:shubhwed/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/models/user.dart';
class homeScreen extends DrawerContent {
  static const String id = 'home_screen';

  final String uid;

  homeScreen({this.uid});


  @override
  _homeScreenState createState() => _homeScreenState(uid);
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  final String uid;
  AuthService _auth=AuthService();

//  String bride ;
//  String groom;
//  String date ;
  FirebaseFirestore firestore;
  Animation animation;
  AnimationController controller;
//  CollectionReference users = FirebaseFirestore.instance.collection('users');

  _homeScreenState(this.uid);
//  Future<void> getDataFromFirestore(String uid) {
//    users.doc(uid).get().then((doc) {
//      setState(() {
//        bride = doc.get('brideName');
//        groom = doc.get('brideGroomName');
//        date = doc.get('date').toString().split(" ")[0];
//      });
//    });
//  }



  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    DatabaseService _db=DatabaseService(widget.uid);

    var user= Provider.of<users>(context);
    print(user);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkPink,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: widget.onMenuPressed,
        ),
        actions: [
          FlatButton(
            child: Row(
              children: [
                Text('Log Out',
                  style: GoogleFonts.bitter(
                    color: Colors.white
                  ),
                ),
                Icon(Icons.logout,
                color: Colors.white,),
              ],
            ),

            onPressed: () async{
              await _auth.signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return onboardingScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body:user==null?Center(child: CircularProgressIndicator()): Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kDarkPink,
              // Color(0xFFD9A2EF),
              kSkin,
              // Color(0xFFEBE7F6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                color: kSkin.withOpacity(0.65),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/couple.png",
                    width: width - 60,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                homePageText(
                  text: "We are inviting you \n to beautify our",
                ),
                Image.asset(
                  "assets/wedding.png",
                  width: width * 0.8,
                ),
                homePageText(
                  text: "with your presence",
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Image.asset(
                    "assets/redSeprator.png",
                    width: width * .9,
                  ),
                ),
                Text(
                  "${user.brideName} & ${user.brideGroomName}",
                  style: GoogleFonts.charm(
                      color: Color(0xffF9190A),
                      fontSize: width / 20,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: homePageText(
                    text: user.date,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class homePageText extends StatelessWidget {
  final String text;

  const homePageText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'BalsamiqSans',
          fontSize: MediaQuery.of(context).size.width / 25),
      textAlign: TextAlign.center,
    );
  }
}
