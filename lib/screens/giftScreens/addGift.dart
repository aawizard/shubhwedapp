import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shubhwed/services/db.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shubhwed/utils/constants.dart';
class addGift extends StatefulWidget {
  @override
  _addGiftState createState() => _addGiftState();
}

class _addGiftState extends State<addGift> {
  String giftName;
  bool giftStatus=false;
  String details;
  int Price;
  String imageUrl;
  String giftUrl;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {



    var user=Provider.of<User>(context);
    DatabaseService _db =DatabaseService(user.uid);
    Future<void> add() {

      print('  dfghj  $giftName');
      return _db.addgift({
        'itemName':giftName,
        'description':details,
        'imgURL':imageUrl,
        'price':Price,
        'productURL':giftUrl,
        'status':giftStatus,
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
          "Add Gift",
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
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter Gift name',hintText: 'Gift Name'),
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? 'Enter Gift name' : null,
                    onChanged: (value) {
                      setState(() {
                        giftName = value;

                      });

                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter Gift Price in Rs',hintText: '400'),
                    keyboardType: TextInputType.number,
                    validator: (val) => val.isEmpty ? 'Enter Gift Price' : null,

                    onChanged: (value) {
                      setState(() {

                        Price = int.parse(value);
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter gift Description(optional)',hintText: 'Enter gift Description'),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {

                        details = value.isEmpty?'':value;
                      });
                      print('  srdtyui     $giftName');
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter gift URL',hintText: 'https://abc.com'),
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? 'Enter gift URL' : null,
                    onChanged: (value) {
                      setState(() {
                        giftUrl = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration.copyWith(labelText: 'Enter giftImage URL(optional)',hintText: 'https://abc.com/abc.png'),
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
                        print(giftName);
                        add();
                      }
                    },


                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Text(
                      "Add Gift",
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
