import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/screens/onboarding_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubhwed/services/db.dart';
import 'package:url_launcher/url_launcher.dart';
class guestDetails extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;
  final String id;

  const guestDetails(
      {Key key, this.name, this.imageUrl, this.email, this.phoneNo, this.gift, this.id})
      : super(key: key);
  @override
  _guestDetailsState createState() =>
      _guestDetailsState(name, imageUrl, email, phoneNo, gift,id);
}

class _guestDetailsState extends State<guestDetails> {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;
  final String id;
  String msg='hello';

  sendwhatsapp() async{
var  uri="https://wa.me/+91${phoneNo}?text=$msg";
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not send whatsapp message")));
  }
}
sendEmail() async{
if(email!='' || email.isNotEmpty) {
  var uri= Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Wedding Invitation',
        'body': msg,
      }

  ).toString();
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not send email")));
  }
}
}

Future<void> sendSms() async{
    var uri='sms:$phoneNo?$msg';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Could not send sms")));
    }
}
  _guestDetailsState(
      this.name, this.imageUrl, this.email, this.phoneNo, this.gift, this.id);
  void handleClick(String value) {
    switch (value) {
      case 'Send SMS':sendSms();
        break;
      case 'Send Email':sendEmail();
        break;
      case 'Send WhatsApp':sendwhatsapp();
        break;
    }
  }

  String giftRecieved;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    DatabaseService _db= DatabaseService(user.uid);
    Future<void> delete() {


      return _db.removeguest(id).then((value) async {

        Navigator.pop(context);
      }).catchError(
            (error) => print("Some error occured while registering"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkPink,
        title: Text(
          "Your Guest",
          style: GoogleFonts.bitter(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: delete,
          ),
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Send SMS', 'Send Email', 'Send WhatsApp'}
                  .map((String choice) {
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
                  maxRadius: MediaQuery.of(context).size.width / 5,
                  backgroundImage: imageUrl == ''
                      ? AssetImage("assets/greySquare.JPG")
                      : NetworkImage(imageUrl),
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
            height: MediaQuery.of(context).size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "Name         :  $name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              phoneNo == null ? "Phone No. : --" : "Phone No. : $phoneNo",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              email == '' ? "Email          :  --" : "Email          : $email",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              gift == '' ? "Gift given   :  --" : "Gift given   : $gift",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),

    );
  }
}
