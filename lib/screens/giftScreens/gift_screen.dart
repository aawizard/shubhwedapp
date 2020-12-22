import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shubhwed/components/giftCard.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/models/user.dart';
import 'package:shubhwed/models/gift.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubhwed/components/giftList.dart';
import 'addGift.dart';

class giftListScreen extends DrawerContent {
  @override
  _giftListScreenState createState() => _giftListScreenState();
}

class _giftListScreenState extends State<giftListScreen> {
  final auth =FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
//    getUID();
  }

  @override
  Widget build(BuildContext context) {
    var user=Provider.of<User>(context);
    DatabaseService db =DatabaseService(user.uid);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              "Gift List",
              style: GoogleFonts.bitter(),
            ),

            backgroundColor: kDarkPink,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                children: [
                  StreamProvider<List<Gift>>.value(
                    value: db.streamgifts(),
                    child: giftList(),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return addGift();
                },
              ));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: kDarkPink,
          ),
        ),
      ),
    );
  }
}


