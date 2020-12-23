
import 'package:flutter/material.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:shubhwed/services/db.dart';
import 'package:shubhwed/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  final users user;

  const EditProfile({Key key, @required this.user}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState(user);
}

class _EditProfileState extends State<EditProfile> {
  _EditProfileState(this.user);
  final users user;
  DateTime selectedDateTime;      bool date=false;
  String name;                    bool nameC=false;
  String phoneNo;                 bool phoneNoC=false;
  String brideName;               bool brideNameC=false;
  String brideGroomname;          bool brideGroomNameC=false;
  String venue;                   bool venueC=false;
  String deliveryAddr;            bool deliveryC=false;
  String bankACNo;                bool bankAC=false;
  String ifscCode;                bool ifscCodeC=false;
  String acHoldername;            bool acHoldernameC=false;
  String payTmNo;                 bool payTmC=false;
  String gPayNo;                  bool gpayNoC=false;
  String upiID;                   bool upiIDC=false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    DatabaseService _db = DatabaseService(user.uid);
    Future<void> registerUser() {
      print(name);


      return _db
          .addUser(
              name: nameC?  name:user.name ,
              phoneNo: phoneNoC? phoneNo:user.phoneNumber,
              uid: user.uid,
              email: user.email,
              brideName: brideNameC?brideName:user.brideName,
              brideGroomname:brideGroomNameC? brideGroomname:user.brideGroomName,
              venue: venueC?venue:user.venue,
              deliveryAddr:deliveryC? deliveryAddr:user.deliveryAddress,
              bankACNo:bankAC? bankACNo:user.bankAccountNumber,
              ifscCode: ifscCodeC?ifscCode:user.ifscCode,
              acHoldername:acHoldernameC? acHoldername:user.accountHolderName,
              payTmNo:payTmC? payTmNo:user.payTmNumber,
              gPayNo:gpayNoC? gPayNo:user.gPayNumber,
              upiID:upiIDC? upiID:user.upiID,
              selectedDateTime:date? selectedDateTime.toString().split(" ")[0] ?? '':user.date)
          .then((value) async {
//
        Navigator.pop(context);
      }).catchError(
        (error) => print("Some error occured while registering"),
      );
    }

    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed:(){ Navigator.pop(context);},
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.bitter(),
        ),

        backgroundColor: kDarkPink,
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

                    initialValue: user.name,
                    decoration: decoration.copyWith(
                        hintText: "Name", labelText: "Name"),
                    keyboardType: TextInputType.name,
                    validator: (v) => v.isEmpty ? 'Enter your name' : null,
                    onChanged: (value) {
                      setState(() {
                        nameC=true;
                        name = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.phoneNumber,
                    decoration: decoration.copyWith(
                        hintText: "Enter your Number",
                        labelText: "Enter your Number"),
                    keyboardType: TextInputType.number,
                    validator: (v) => v.isEmpty ? 'Enter brides name' : null,
                    onChanged: (value) {
                      setState(() {
                        phoneNoC=true;
                        phoneNo = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.brideName,
                    decoration: decoration.copyWith(
                        hintText: "Bride's Name", labelText: "Bride's Name"),
                    keyboardType: TextInputType.name,
                    validator: (v) => v.isEmpty ? 'Enter brides name' : null,
                    onChanged: (value) {
                      setState(() {
                        brideNameC=true;
                        brideName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.brideGroomName,
                    validator: (v) =>
                        v.isEmpty ? "Enter bridegroom's name" : null,
                    decoration: decoration.copyWith(
                        hintText: "Bridegroom's Name",
                        labelText: "Bridegroom's Name"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        brideGroomNameC=true;
                        brideGroomname = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.venue,
                    validator: (v) => v.isEmpty ? 'Enter vennue address' : null,
                    decoration: decoration.copyWith(
                        hintText: "Venue", labelText: "Venue"),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) {
                      setState(() {
                        venueC=true;
                        venue = value;
                      });
                    },
                  ),
                ),
                OutlineButton(
                  child: Text(date?user.date
                  :(selectedDateTime == null
                      ? "Choose Date"
                      : selectedDateTime.toString().split(" ")[0])),
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
                          date=true;
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
                    initialValue: user.deliveryAddress,
                    decoration: decoration.copyWith(
                        hintText: "Delivery Address",
                        labelText: "Delivery Address"),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) {
                      setState(() {
                        deliveryC=true;
                        deliveryAddr = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.bankAccountNumber,
                    decoration: decoration.copyWith(
                        hintText: "Bank Account Number",
                        labelText: "Bank Account Number"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        bankAC=true;
                        bankACNo = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.ifscCode,
                    decoration: decoration.copyWith(
                        hintText: "IFSC Code", labelText: "IFSC Code"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        ifscCodeC=true;
                        ifscCode = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.accountHolderName,
                    decoration: decoration.copyWith(
                        hintText: "Bank Holder's Name",
                        labelText: "Bank Holder's Name"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        acHoldernameC=true;
                        acHoldername = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.payTmNumber,
                    decoration: decoration.copyWith(
                        hintText: "PayTM Number", labelText: "PayTM Number"),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        payTmC=true;
                        payTmNo = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.gPayNumber,
                    decoration: decoration.copyWith(
                        hintText: "GPay Number", labelText: "GPay Number"),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        gpayNoC=true;
                        gPayNo = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    initialValue: user.upiID,
                    decoration: decoration.copyWith(
                        hintText: "UPI ID", labelText: "UPI ID"),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        upiIDC=true;
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
                    onPressed: () {
                      if (_formKey.currentState.validate()) registerUser();
                    },
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Text(
                      "Update",
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
