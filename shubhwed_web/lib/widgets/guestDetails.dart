import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GuestDetails extends StatefulWidget {
  Map<String, dynamic> data;
  GuestDetails(this.data);
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
  var _msgController = TextEditingController();
  var _guestID = TextEditingController();
  var msg;

  int _radioValue = 0;
  String attendStatus;
  void _submitData() {
    var x = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.data['uid'])
        .collection('guestList')
        .where("phoneNO", isEqualTo: _guestEmailController.text)
        .get()
        .then((value) => print(value));

    print(x);
    print("hello)");

    //print(widget.data);
    if (_guestEmailController.text.isEmpty ||
        _guestNameController.text.isEmpty ||
        _msgController.text.isEmpty ||
        _numGuestController.text.isEmpty) return;
    print(_numGuestController.text);

    CollectionReference users = FirebaseFirestore.instance
        .collection('users/' + widget.data['uid'] + '/guestList');
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.data['uid'])
        .collection('guestList')
        .doc(_guestID.text)
        .update({
      'numOfGuest': _numGuestController.text, // John Doe
      'guestName': _guestNameController.text, // Stokes and Sons
      'guestEmail': _guestEmailController.text,
      'msg': _msgController.text,
      'attendStatus': attendStatus
    }).then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));;

 
    
        
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          attendStatus = 'Yes.I\'ll be there in person';
          break;
        case 1:
          attendStatus = 'No,I can\'t attend';
          break;
        case 2:
          attendStatus = 'I\'m not sure';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Radio(
              value: 0,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text(
              'Yes.I\'ll be there in person',
              style: TextStyle(
                  fontSize: (8 / 720) * MediaQuery.of(context).size.width,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text(
              'No,I can\'t attend',
              style: TextStyle(
                  fontSize: (8 / 720) * MediaQuery.of(context).size.width,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            new Radio(
              value: 2,
              groupValue: _radioValue,
              onChanged: _handleRadioValueChange,
            ),
            new Text(
              'I\'m not sure',
              style: TextStyle(
                  fontSize: (8 / 720) * MediaQuery.of(context).size.width,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            controller: _guestID,
            decoration: InputDecoration(
              hintText: 'Enter guest ID ',
            ),
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            controller: _numGuestController,
            decoration: InputDecoration(
              hintText: 'Number of guest attending',
            ),
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Your name',
            ),
            controller: _guestNameController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
            ),
            controller: _guestEmailController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.6,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Message for couple',
            ),
            controller: _msgController,
            onSubmitted: (_) => _submitData(),
          ),
        ),
        
        width>height?
        
           ClipRRect(
          child: Container(
            height: width*0.025,
            width: width * 0.11,
            color: Colors.pink[300],
            child: Center(
              child: FlatButton(
                onPressed: _submitData,
                child: Text(
                  "Send RSVP",
                ),
              ),
            ),
          ),
        ):  ClipRRect(
          child: Container(
            height: height*0.05,
            width: width * 0.3,
            color: Colors.pink[300],
            child: Center(
              child: FlatButton(
                onPressed: _submitData,
                child: Text(
                  "Send RSVP",
                ),
              ),
            ),
          ),

        ),
      
      ],
    );
  }
}
