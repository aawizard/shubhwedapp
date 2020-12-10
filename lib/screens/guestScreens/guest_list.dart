import 'package:flutter/material.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shubhwed/components/guestcard.dart';

class guestListScreen extends DrawerContent {
  @override
  _guestListScreenState createState() => _guestListScreenState();
}

class _guestListScreenState extends State<guestListScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                guestCard(
                  name: "Aman V",
                  invitationStatus: true,
                  gift: "Phone",
                  email: "aman.2022@gmail.com",
                  guestNumber: 4,
                  imageURL:
                      "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                ),
                guestCard(
                  name: "Karan Singh",
                  invitationStatus: true,
                  gift: "Washing Machine",
                  email: "Karansingh123@gmail.com",
                  guestNumber: 1,
                  imageURL:
                      "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                ),
                guestCard(
                  name: "Akhil D'Souza",
                  invitationStatus: true,
                  gift: "Dinning Table",
                  email: "dakhildsouza@gmail.com",
                  guestNumber: 5,
                  imageURL:
                      "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                ),
                guestCard(
                  name: "Sushila Ben",
                  invitationStatus: false,
                  gift: "Water Purifier",
                  email: "shushila@gmail.com",
                  guestNumber: 2,
                  imageURL:
                      "https://images.unsplash.com/photo-1554080353-a576cf803bda?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
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

//class guestCard extends StatefulWidget {
//  const guestCard({
//    Key key,
//    @required this.name,
//    @required this.invitationStatus,
//    this.imageURL ,
//    this.guestNumber ,
//    this.phoneNo,
//    this.email,
//    this.gift,
//  }) : super(key: key);
//  final String name;
//  final bool invitationStatus;
//  final String imageURL;
//  final int guestNumber;
//  final String phoneNo;
//  final String email;
//  final String gift;
//
//  @override
//  Widget build(BuildContext context) {
//    return ListTile(
//      tileColor: kDarkPink,
//      leading: FadeInImage.assetNetwork(
//        image: imageURL,
//        placeholder: 'assets/shubhwed.png',
//      ),
//
//      title: Text(
//        name,
//        textAlign: TextAlign.center,
//        style: GoogleFonts.bitter(fontWeight: FontWeight.w700),
//      ),
//      subtitle: invitationStatus == true
//          ? Text(
//              "Invitation Sent",
//              textAlign: TextAlign.center,
//              style: GoogleFonts.bitter(color: Colors.green),
//            )
//          : Text(
//              "Invitation not Sent",
//              textAlign: TextAlign.center,
//              style: GoogleFonts.bitter(color: Colors.red),
//            ),
//      trailing: Text("+$guestNumber"),
//      onTap: () {
//        Navigator.push(context, MaterialPageRoute(
//          builder: (context) {
//            return guestDetails(
//              name: name,
//              imageUrl: imageURL,
//              phoneNo: phoneNo,
//              email: email,
//            );
//          },
//        ));
//      },
//    );
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    throw UnimplementedError();
//  }
//}
