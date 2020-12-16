import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shubhwed/screens/registration_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'login_screen.dart';
import 'package:shubhwed/services/auth.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;


  final InputDecoration decoration = new InputDecoration(
    focusedBorder: new OutlineInputBorder(
      borderSide: BorderSide(color: kPink),
    ),
    labelStyle: TextStyle(color: Colors.black),
    hintText: "Name",
    labelText: "Name",
  );
  String name, phoneNo, email, password;

  @override
  void initState() {
    super.initState();
  }

  void verifyInputs() {
    String warning = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: kPink),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    decoration: decoration,
                    keyboardType: TextInputType.text,
                    validator: (val) => val.isEmpty ? 'Enter name' : null,
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
                    decoration: decoration.copyWith(
                        hintText: "Phone No.", labelText: "Phone No."),
                    keyboardType: TextInputType.phone,
                    validator: (val) =>
                        val.length != 10 ? 'Enter a valid phone number' : null,
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
                    decoration: decoration.copyWith(
                        hintText: "Email", labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: decoration.copyWith(
                        hintText: "Password", labelText: "Password"),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(),
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == 'email') {
                            setState(() {
                              error='The account already exists for that mail.\nTry different email account or use Login page.';
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "The account already exists for that mail.\nTry different email account or use Login page.")));
                          } else if (result == null) {
                            setState(() {
                              error='Some thing went wrong try again';
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(

                                content: Text(
                                    "Some thing went wrong try again")));
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegistrationScreen(
                                      uid: result.uid.toString(),
                                      email: result.email.toString());
                                },
                              ),
                            );
                          }
                        }else{
                          setState(() {
                            error='Fill all the fields, phone number of ten digits and a strong password';
                          });
                          print('hi');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Fill all the fields, phone number of ten digits and a strong password")));
                        }
                      },
                      color: kPink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
