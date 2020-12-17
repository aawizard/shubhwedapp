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

class giftListScreen extends DrawerContent {
  @override
  _giftListScreenState createState() => _giftListScreenState();
}

class _giftListScreenState extends State<giftListScreen> {
  final auth =FirebaseAuth.instance;
//  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

//  getUID() {
//    prefs.then((value) {
//      setState(() {
//        uid = value.getString('uid');
//      });
//    });
//  }

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
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            backgroundColor: kDarkPink,
          ),
          body: Padding(
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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

/*

GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                semanticChildCount: 2,
                childAspectRatio: 0.6,
                children: <Widget>[
                  ],
              ),


Text("Avneesh Kumar $uid"),
                  giftCard(
                      giftName: "Phone",
                      giftStatus: false,
                      Price: 2000,
                      giftUrl: "https://www.google.co.in/",
                      details: "helolo",
                      imageUrl: ""),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  giftCard(
                    giftName: "Phone",
                    giftStatus: false,
                    Price: 2000,
                    giftUrl: "https://www.google.co.in/",
                    details: "helolo",
                    imageUrl:
                        "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                
*/
