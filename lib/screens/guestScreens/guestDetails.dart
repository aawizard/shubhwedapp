import 'package:flutter/material.dart';
import 'package:shubhwed/screens/onboarding_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class guestDetails extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;

  const guestDetails({Key key, this.name, this.imageUrl, this.email, this.phoneNo, this.gift}) : super(key: key);
  @override
  _guestDetailsState createState() => _guestDetailsState(name,imageUrl,email,phoneNo,gift);
}

class _guestDetailsState extends State<guestDetails> {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;

  _guestDetailsState(this.name, this.imageUrl, this.email, this.phoneNo, this.gift);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width/5,
                  backgroundImage: imageUrl==''?AssetImage("assets/greySquare.JPG"):NetworkImage(imageUrl),
                  backgroundColor: kPink,

                ),

              ),


              decoration: new BoxDecoration(
                color: kPink, // border color
                shape: BoxShape.circle,

              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height/20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Text("Name         :  $name",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Text(phoneNo==""?"Phone No. : --":"Phone No. : $phoneNo",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Text(email==''?"Email          :  --":"Email          : $email",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Text(gift==''?"Gift given   :  --":"Gift given   : $gift",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete,
        color: Colors.white,),
        backgroundColor: kDarkPink,
        onPressed: (){},
      ),
    );
  }
}
