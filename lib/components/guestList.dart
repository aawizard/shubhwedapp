import 'package:flutter/material.dart';
import 'package:shubhwed/screens/guestScreens/guestDetails.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/models/guest.dart';
import 'package:shubhwed/models/user.dart';
import 'package:shubhwed/components/guestcard.dart';
class guestList extends StatefulWidget {

  @override
  _guestListState createState() => _guestListState();
}

class _guestListState extends State<guestList> {


  @override
  Widget build(BuildContext context) {
    var guests= Provider.of<List<Guest>>(context);
    var user=Provider.of<users>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:guests==null?Center(child: CircularProgressIndicator()): ListView(
        children: guests.map((guest){
          return guestCard(guest: guest,user: user,);
        } ).toList(),
      )


    );
  }
}
