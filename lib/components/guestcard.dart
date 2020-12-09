import 'package:flutter/material.dart';
import 'package:shubhwed/screens/guestScreens/guestDetails.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
class guestCard extends StatefulWidget {
  final String name;
  final bool invitationStatus;
  final String imageURL;
  final int guestNumber;
  final String phoneNo;
  final String email;
  final String gift;

  const guestCard({Key key, this.name, this.invitationStatus, this.imageURL, this.guestNumber, this.phoneNo, this.email, this.gift}) : super(key: key);

  @override
  _guestCardState createState() => _guestCardState(name,invitationStatus,imageURL,guestNumber,phoneNo,email,gift);
}

class _guestCardState extends State<guestCard> {

  final String name;
  final bool invitationStatus;
  final String imageURL;
  final int guestNumber;
  final String phoneNo;
  final String email;
  final String gift;

  _guestCardState(this.name, this.invitationStatus, this.imageURL, this.guestNumber, this.phoneNo, this.email, this.gift);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ListTile(

        leading: Container(


          child: FadeInImage.assetNetwork(

            image: imageURL,
            placeholder: 'assets/shubhwed.png',
          ),
        ),

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
        ),
      ),
    );
  }
}
