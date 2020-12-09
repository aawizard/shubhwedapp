import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/screens/home_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shubhwed/components/navigationDrawer.dart';


class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({this.uid, this.email});
  final String uid;
  final String email;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final InputDecoration decoration = new InputDecoration(
    focusedBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: kPink),
    ),
    labelStyle: TextStyle(color: Colors.black),
    hintText: "Name",
    labelText: "Name",
  );
  DateTime selectedDateTime;
  String brideName,
      brideGroomname,
      venue,
      deliveryAddr,
      bankACNo,
      ifscCode,
      acHoldername,
      payTmNo,
      gPayNo,
      upiID;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> registerUser() {
      return users.doc("${widget.uid}").set({
        'uid': widget.uid ?? '',
        'email': widget.email ?? '',
        'brideName': brideName ?? '',
        'brideGroomName': brideGroomname ?? '',
        'venue': venue ?? '',
        'deliveryAddress': deliveryAddr ?? '',
        'bankAccountNumber': bankACNo ?? '',
        'ifscCode': ifscCode ?? '',
        'accountHolderName': acHoldername ?? '',
        'payTmNumber': payTmNo ?? '',
        'gPayNumber': gPayNo ?? '',
        'upiID': upiID ?? '',
        'date': selectedDateTime ?? ''
      }).then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('uid', widget.uid);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainWidget()),
        );
      }).catchError(
        (error) => print("Some error occured while registering"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Registration", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Bride's Name", labelText: "Bride's Name"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      brideName = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Bridegroom's Name",
                      labelText: "Bridegroom's Name"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      brideGroomname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Venue", labelText: "Venue"),
                  keyboardType: TextInputType.streetAddress,
                  onChanged: (value) {
                    setState(() {
                      venue = value;
                    });
                  },
                ),
              ),
              OutlineButton(
                child: Text(selectedDateTime == null
                    ? "Choose Date"
                    : selectedDateTime.toString().split(" ")[0]),
                onPressed: () async {
                  final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2025),
                    firstDate: DateTime(2000),
                  );
                  if (picked != null && picked != selectedDateTime) {
                    setState(
                      () {
                        selectedDateTime = picked;
                      },
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Delivery Address",
                      labelText: "Delivery Address"),
                  keyboardType: TextInputType.streetAddress,
                  onChanged: (value) {
                    setState(() {
                      deliveryAddr = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Bank Account Number",
                      labelText: "Bank Account Number"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      bankACNo = value;
                    });
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     decoration: decoration.copyWith(
              //         hintText: "Bank Account Number",
              //         labelText: "Bank Account Number"),
              //     keyboardType: TextInputType.name,
              //     onChanged: (value) {
              //       setState(() {
              //         brideName = value;
              //       });
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "IFSC Code", labelText: "IFSC Code"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      ifscCode = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Bank Holder's Name",
                      labelText: "Bank Holder's Name"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      acHoldername = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "PayTM Number", labelText: "PayTM Number"),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      payTmNo = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "GPay Number", labelText: "GPay Number"),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      gPayNo = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "UPI ID", labelText: "UPI ID"),
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      upiID = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(),
                child: RaisedButton(
                  color: kPink,
                  onPressed: registerUser,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
