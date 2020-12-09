import 'package:flutter/material.dart';
import 'package:shubhwed/components/drawer.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/screens/guestScreens/guestDetails.dart';

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
          body: Column(
            children: [
              guestCard(
                name: "hello",
                invitationStatus: false,
              ),
              guestCard(
                name: "hello",
                invitationStatus: true,
              ),
            ],
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

class guestCard extends StatefulWidget {
  const guestCard({
    Key key,
    @required this.name,
    @required this.invitationStatus,
    this.imageURL = "",
    this.guestNumber = 1,
    this.phoneNo,
    this.email,
    this.gift,
  }) : super(key: key);
  final String name;
  final bool invitationStatus;
  final String imageURL;
  final int guestNumber;
  final String phoneNo;
  final String email;
  final String gift;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: kDarkPink,
      leading: Image.network(imageURL),
      title: Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.bitter(fontWeight: FontWeight.w700),
      ),
      subtitle: invitationStatus == true
          ? Text(
              "Invitation Sent",
              textAlign: TextAlign.center,
              style: GoogleFonts.bitter(color: Colors.green),
            )
          : Text(
              "Invitation not Sent",
              textAlign: TextAlign.center,
              style: GoogleFonts.bitter(color: Colors.red),
            ),
      trailing: Text("+$guestNumber"),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return guestDetails(
              name: name,
              imageUrl: imageURL,
              phoneNo: phoneNo,
              email: email,
            );
          },
        ));
      },
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
