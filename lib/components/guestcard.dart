import 'package:flutter/material.dart';
import 'package:shubhwed/models/guest.dart';
import 'package:shubhwed/screens/guestScreens/guestDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/models/user.dart';

class guestCard extends StatefulWidget {

  final Guest guest;
  final users user;
  const guestCard(
      {Key key,
     this.guest, this.user})
      : super(key: key);

  @override
  _guestCardState createState() => _guestCardState(guest);
}

class _guestCardState extends State<guestCard> {

  final Guest guest;


  _guestCardState(this.guest);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                guest: guest,
                user: widget.user,
              );
            },
          ));
        },
      ),
    );
  }
}


//Card(
//            elevation: 2,
//            child: ListTile(
//              leading: Container(
//                child: FadeInImage.assetNetwork(
//                  image: guest.imageURL,
//                  placeholder: 'assets/shubhwed.png',
//                ),
//              ),
//              title: Text(
//                guest.name,
//                textAlign: TextAlign.center,
//                style: GoogleFonts.bitter(fontWeight: FontWeight.w700),
//              ),
//              subtitle: guest.invitationStatus == true
//                  ? Text(
//                "Invitation Sent",
//                textAlign: TextAlign.center,
//                style: GoogleFonts.bitter(color: Colors.green),
//              )
//                  : Text(
//                "Invitation not Sent",
//                textAlign: TextAlign.center,
//                style: GoogleFonts.bitter(color: Colors.red),
//              ),
//              trailing: Text("+${guest.guestNumber}"),
//              onTap: () {
//                Navigator.push(context, MaterialPageRoute(
//                  builder: (context) {
//                    return guestDetails(
//                      guest: guest,
//                      user: user,
//                    );
//                  },
//                ));
//              },
//            ),
//          );