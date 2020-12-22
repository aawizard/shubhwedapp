import 'package:flutter/material.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubhwed/models/guest.dart';
import 'package:shubhwed/components/guestList.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/screens/guestScreens/addguest.dart';
class guestListScreen extends DrawerContent {
  @override
  _guestListScreenState createState() => _guestListScreenState();
}

class _guestListScreenState extends State<guestListScreen> {
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var user=Provider.of<User>(context);
    DatabaseService db =DatabaseService(user.uid);
    Future<bool> _onBackPress() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainWidget()));
    }

    return WillPopScope(
      onWillPop: _onBackPress,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: widget.onMenuPressed,
            ),
            title: Text(
              "Guest List",
              style: GoogleFonts.bitter(),
            ),
            backgroundColor: kDarkPink,
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: StreamProvider<List<Guest>>.value(
              value: db.streamguest(),
              child: guestList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return addGuest();
                },
              ));
            },
            child: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            backgroundColor: kDarkPink,
          ),
        ),
      ),
    );
  }
}

