import 'package:flutter/material.dart';

class GuestDetails extends StatefulWidget {
  @override
  _GuestDetailsState createState() => _GuestDetailsState();
}

class _GuestDetailsState extends State<GuestDetails> {
  var _numGuestController = TextEditingController();
  var numGuest;
  var _guestNameController = TextEditingController();
  var guestName;
  var _guestEmailController = TextEditingController();
  var guestEmail;
  var _msg = TextEditingController();
  var msg;
  void _submitData() {
    print(_numGuestController.text);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(hintText: 'Number of guest attending'),
            controller: _numGuestController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(hintText: 'Your name'),
            controller: _guestNameController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter your email'),
            controller: _guestEmailController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(hintText: 'Message for couple'),
            controller: _msg,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        ClipRRect(
            
                  child: Container(
            
            height: height * 0.05,
            width: width * 0.11,
            color: Colors.pink[300],
            child: Center(child: Text('Send RSVP', style: TextStyle(
                      fontSize: (6 / 720) * MediaQuery.of(context).size.width,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),)),
          ),
        )
      ],
    );
  }
}
