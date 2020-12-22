import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shubhwed/screens/signup_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shubhwed/components/navigationDrawer.dart';
import 'package:shubhwed/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  String email, password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        "Log In",
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
                                builder: (context) => signUpScreen()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: kPink),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
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
                  margin: EdgeInsets.symmetric(vertical: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: decoration.copyWith(
                        hintText: "Password", labelText: "Password"),

                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {

                          try {
                            AuthService  auth = AuthService();
                            auth.signInWithEmailAndPassword(email,password);
//                          UserCredential userCredential = await FirebaseAuth
//                              .instance
//                              .signInWithEmailAndPassword(
//                                  email: email, password: password);
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return MainWidget();
                              },
                            ));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No user found for that email."),
                              ));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Wrong password provided.")));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Some error occured.")));
                          }







                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Enter all details"),
                          ));
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
