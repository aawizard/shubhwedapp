import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhwed/screens/home_screen.dart';
import 'package:shubhwed/utils/constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({this.uid, this.email, this.name, this.phoneNo});
  final String uid;
  final String email;
  final String name;
  final String phoneNo;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState(name,phoneNo,uid);
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final myController = TextEditingController();

  DateTime selectedDateTime;
  final String name, phoneNo,uid;
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

  _RegistrationScreenState(this.name, this.phoneNo, this.uid);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var user=Provider.of<User>(context);
    DatabaseService _db =DatabaseService(uid);
    Future<void> registerUser() {
      return _db.addUser(
//          {
//        'displayName': name??'',
//        'phoneNumber':phoneNo??'',
//        'uid': user.uid ?? '',
//        'email': user.email ?? '',
//        'brideName': brideName ?? '',
//        'brideGroomName': brideGroomname ?? '',
//        'venue': venue ?? '',
//        'deliveryAddress': deliveryAddr ?? '',
//        'bankAccountNumber': bankACNo ?? '',
//        'ifscCode': ifscCode ?? '',
//        'accountHolderName': acHoldername ?? '',
//        'payTmNumber': payTmNo ?? '',
//        'gPayNumber': gPayNo ?? '',
//        'upiID': upiID ?? '',
//        'date': selectedDateTime.toString().split(" ")[0] ?? ''
//      }
      name: name,
        phoneNo: phoneNo,
        uid: user.uid,
        email: user.email,
        brideName: brideName,
        brideGroomname: brideGroomname,
        venue: venue,
        deliveryAddr: deliveryAddr,
        bankACNo: bankACNo,
        ifscCode: ifscCode,
        acHoldername: acHoldername,
        payTmNo: payTmNo,
        gPayNo: gPayNo,
        upiID: upiID,
        selectedDateTime: selectedDateTime
      ).then((value) async {
//        SharedPreferences prefs = await SharedPreferences.getInstance();
//        prefs.setString('uid', widget.uid);
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
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    controller: myController,
                    decoration: decoration.copyWith(
                        hintText: "Bride's Name", labelText: "Bride's Name"),
                    keyboardType: TextInputType.name,
                    validator: (v)=>v.isEmpty?'Enter brides name':null,
                    onChanged: (value) {
                      setState(() {
                        brideName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    validator: (v)=>v.isEmpty?"Enter bridegroom's name":null,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    validator: (v)=>v.isEmpty?'Enter vennue address':null,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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

                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
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
                    onPressed:(){
                      if(_formKey.currentState.validate())
                      registerUser();

                      },
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
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

}
