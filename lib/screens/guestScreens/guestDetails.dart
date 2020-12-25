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
import 'package:shubhwed/models/guest.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:io';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class guestDetails extends StatefulWidget {
//  final String name;
//  final String imageUrl;
//  final String email;
//  final String phoneNo;
//  final String gift;
//  final String id;
  final users user;
  final Guest guest;
  const guestDetails({Key key, this.user, this.guest}) : super(key: key);
  @override
  _guestDetailsState createState() =>
      _guestDetailsState(user: user, guest: guest);
}

class _guestDetailsState extends State<guestDetails> {
  final Guest guest;
  final users user;

  String msg;
  String website;

  _guestDetailsState({this.user, this.guest});

  @override
  void initState() {
    super.initState();
    setState(() {
      website = "https://abhijeet-sonkar.github.io/Shubhwed_web//#/${user.uid}";
      msg =
          "${guest.name} ji,\n We cordially invite you to attend the wedding of \n ${user.brideName} & ${user.brideGroomName} \n on ${user.date} at ${user.venue} \n Please use your following \n guset id : ${guest.id} in the RSVP section of the website \n $website";

    });
  }

//  String giftRecieved;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    DatabaseService _db = DatabaseService(user.uid);
    sendwhatsapp() async {
      final link = WhatsAppUnilink(
        phoneNumber: '+91${guest.phoneNo}',
        text: msg,
      );
//      var uri = "https://wa.me/+91${guest.phoneNo}?body=$msg";
      if (await canLaunch('$link')) {
        await launch('$link');
        _db.updateInviteStatus(guest.id);

        print(link);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Could not send whatsapp message")));
      }
    }

    sendEmail() async {
      if (guest.email != '' || guest.email.isNotEmpty) {

        final Email mail = Email(
          body: msg,
          subject: 'Wedding Invitation',
          recipients: [guest.email],
        );
        String platformResponse;
        try {
          await FlutterEmailSender.send(mail);
          platformResponse = 'success';
          _db.updateInviteStatus(guest.id);
        } catch (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Could not send email")));
          platformResponse = error.toString();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email Address Not Provider")));
      }
    }

    void sendSms() async {
      bool sent = true;
      String _result = await sendSMS(message: msg, recipients: [guest.phoneNo])
          .catchError((onError) {
        print(onError);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Could not send sms")));
        setState(() {
          sent = false;
        });
      });
      sent ? _db.updateInviteStatus(guest.id) : null;
      print(_result);
    }

    Future<void> delete() {
      return _db.removeguest(guest.id).then((value) async {
        Navigator.pop(context);
      }).catchError(
        (error) => print("Some error occured while registering"),
      );
    }

    void handleClick(String value) {
      switch (value) {
        case 'Send SMS':
          sendSms();
          break;
        case 'Send Email':
          sendEmail();
          break;
        case 'Send WhatsApp':
          sendwhatsapp();
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                    child: CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.width / 5,
                      backgroundImage: guest.imageURL == ''
                          ? AssetImage("assets/greySquare.JPG")
                          : NetworkImage(guest.imageURL),
                      backgroundColor: kPink,
                    ),
                  ),
                  decoration: new BoxDecoration(
                    color: kPink, // border color
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  guest.name,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: guest.RSVPstatus
                      ? Text(
                          'RSVP Recieved',
                          style: TextStyle(color: Colors.green),
                        )
                      : Text('RSVP not Recieved',
                          style: TextStyle(color: Colors.red)))
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          ProfileCard(leading: 'Phone No. :', title: guest.phoneNo,),
          guest.email == '' ? SizedBox() : ProfileCard(leading: 'Phone Number :', title: guest.phoneNo,),
          guest.RSVPstatus == false ? SizedBox()  : ProfileCard(leading: 'Gift given :', title: guest.gift,),
          guest.RSVPstatus == false ? SizedBox() : ProfileCard(leading: 'Message for Couple', title: guest.message,),

          ProfileCard(leading: 'Message will be:', title: msg,),
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//            child: Row(
//              children: [
//
//                Container(
//                  child: Text(
//                    'Message will be: ',
//                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                  ),
//                ),
//                Container(
//                    width: MediaQuery.of(context).size.width / 2,
//                    child: Text(msg)),
//              ],
//            ),
//          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    @required this.leading,
    this.title,
  }) : super(key: key);

  final String leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: kDarkPink,
      elevation: 5,
      child: ListTile(
        leading: Text(leading),
        title: Text(
          (title == '' || title.isEmpty) ? '-' : title,
        ),
      ),
    );
  }
}
