import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/screens/onboarding_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubhwed/services/db.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shubhwed/models/user.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:io';
class guestDetails extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;
  final String id;
  final users user;

  const guestDetails(
      {Key key, this.name, this.imageUrl, this.email, this.phoneNo, this.gift, this.id, this.user})
      : super(key: key);
  @override
  _guestDetailsState createState() =>
      _guestDetailsState(name, imageUrl, email, phoneNo, gift,id,user);
}

class _guestDetailsState extends State<guestDetails> {
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNo;
  final String gift;
  final users user;
  final String id;
  String msg;
  String website='https://www.google.co.in/';

  _guestDetailsState(
      this.name, this.imageUrl, this.email, this.phoneNo, this.gift, this.id, this.user);

@override
  void initState() {

    super.initState();
    setState(() {
      msg="$name ji,\n We cordially invite you to attend the wedding of \n ${user.brideName} & ${user.brideGroomName} \n on ${user.date} at ${user.venue} \n Please use your following \n guset id : $id in the RSVP section of the website \n $website";
    });
  }
//  String giftRecieved;
  @override
  Widget build(BuildContext context) {

    var user = Provider.of<User>(context);
    DatabaseService _db= DatabaseService(user.uid);
    sendwhatsapp() async{
      var  uri="https://wa.me/+91${phoneNo}?body=$msg";
      if (await canLaunch(uri)) {
        await launch(uri);
        _db.updateInviteStatus(id);

        print(msg);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Could not send whatsapp message")));
      }
    }
    sendEmail() async{
      if(email!='' || email.isNotEmpty) {
//        var uri= Uri(
//            scheme: 'mailto',
//            path: email,
//            queryParameters: {
//              'subject': 'Wedding Invitation',
//              'body': msg,
//            }
//
//        ).toString();
//        if (await canLaunch(uri)) {
//          await launch(uri);
//          _db.updateInviteStatus(id);
//        } else {
//          ScaffoldMessenger.of(context).showSnackBar(
//              SnackBar(content: Text("Could not send email")));
//        }
        final Email mail = Email(
          body: msg,
          subject: 'Wedding Invitation',
          recipients: [email],

//          isHTML: false,
        );
        String platformResponse;
        try {
          await FlutterEmailSender.send(mail);
          platformResponse = 'success';
          _db.updateInviteStatus(id);
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Could not send email")));
          platformResponse = error.toString();
        }

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email Address Not Provider")));
      }
    }

//    sendSms() async{
//      var uri='sms:+91$phoneNo?$msg';
//      if (await canLaunch(uri)) {
//        await launch(uri);
//        _db.updateInviteStatus(id);
//        print(msg);
//      } else {
//        ScaffoldMessenger.of(context).showSnackBar(
//            SnackBar(content: Text("Could not send sms")));
//      }
//    }
    void sendSms() async {
      bool sent=true;
      String _result = await sendSMS(message: msg, recipients: [phoneNo])
          .catchError((onError) {
        print(onError);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Could not send sms")));
        setState(() {
          sent=false;
        });
      });
      sent?_db.updateInviteStatus(id):null;
      print(_result);
    }

    Future<void> delete() {


      return _db.removeguest(id).then((value) async {

        Navigator.pop(context);
      }).catchError(
            (error) => print("Some error occured while registering"),
      );
    }
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Row(
              children: [
                Container(
                  child: Text('Message will be: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                    child: Text(msg)),
              ],
            ),
          )
        ],
      ),

    );
  }
}
