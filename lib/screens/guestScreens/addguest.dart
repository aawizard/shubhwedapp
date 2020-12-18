import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';
class addGuest extends StatefulWidget {
  @override
  _addGuestState createState() => _addGuestState();
}

class _addGuestState extends State<addGuest> {
  String name;
  int guestNo;
  String imageUrl;
  String email;
  String phoneNo;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {



    var user=Provider.of<User>(context);
    DatabaseService _db =DatabaseService(user.uid);
    Future<void> add() {


      return _db.addguest({
        'email':email,
        'gift':'',
        'imageURL':imageUrl,
        'guestNumber':guestNo,
        'name':name,
        'invitationStatus':false,
        'phoneNo':phoneNo,
      }
      ).then((value) async {

        Navigator.pop(context);
      }).catchError(
            (error) => print("Some error occured while registering"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkPink,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Gift List",
          style: GoogleFonts.bitter(),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                   EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter guest name',hintText: 'Name'),
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? 'Enter guest name' : null,
                    onChanged: (value) {
                      setState(() {
                        name = value;

                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter no. of guets',hintText: '4'),
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? 'Enter no. of guets' : null,

                    onChanged: (value) {
                      setState(() {

                        guestNo = value.isEmpty?1:int.parse(value);
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter guests phone No.',hintText: '9879879879'),
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? 'Enter guests phone No. ' : null,
                    onChanged: (value) {
                      setState(() {

                        phoneNo = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter guests email id(optional)',hintText: 'abc@email.com'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value.isEmpty?'':value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter Image URL(optional)',hintText: 'https://abc.com/abc.png'),
                    keyboardType: TextInputType.text,

                    onChanged: (value) {
                      setState(() {
                        imageUrl = value.isEmpty?'':value;
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

                      if( _formKey.currentState.validate()){
                        add();
                      }
                    },


                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Text(
                      "Add Guest to list",
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
}
