import 'package:flutter/material.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class guestDetails extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;

  const guestDetails({Key key, this.name, this.imageUrl, this.email, this.phoneNo}) : super(key: key);
  @override
  _guestDetailsState createState() => _guestDetailsState();
}

class _guestDetailsState extends State<guestDetails> {
  void handleClick(String value) {
    switch (value) {
      case 'Send SMS':
        break;
      case 'Send Email':
        break;
      case 'Send WhatsApp':
        break;
    }
  }
  String giftRecieved;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor:kDarkPink ,
        title: Text("Guest List",
          style: GoogleFonts.bitter(
          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },

          ),
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Send SMS', 'Send Email', 'Send WhatsApp'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
