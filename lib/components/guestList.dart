import 'package:flutter/material.dart';
import 'package:shubhwed/screens/guestScreens/guestDetails.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/models/guest.dart';
class guestList extends StatefulWidget {

  @override
  _guestListState createState() => _guestListState();
}

class _guestListState extends State<guestList> {


  @override
  Widget build(BuildContext context) {
    var guests= Provider.of<List<Guest>>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:guests==null?Center(child: CircularProgressIndicator()): ListView(
        children: guests.map((guest){
          return  Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: FadeInImage.assetNetwork(
                  image: guest.imageURL,
                  placeholder: 'assets/shubhwed.png',
                ),
              ),
              title: Text(
                guest.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.bitter(fontWeight: FontWeight.w700),
              ),
              subtitle: guest.invitationStatus == true
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
              trailing: Text("+${guest.guestNumber}"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return guestDetails(
                      name:guest.name,
                      imageUrl: guest.imageURL,
                      phoneNo:guest.phoneNo,
                      email: guest.email,
                      gift: guest.gift,
                      id: guest.id,
                    );
                  },
                ));
              },
            ),
          );
        } ).toList(),
      )


    );
  }
}
