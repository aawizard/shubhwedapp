import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shubhwed/screens/registration_screen.dart';
import 'package:shubhwed/utils/constants.dart';
import 'login_screen.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
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
                child: TextField(
                  decoration: decoration,
                  keyboardType: TextInputType.text,
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
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Phone No.", labelText: "Phone No."),
                  keyboardType: TextInputType.phone,
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
                child: TextField(
                  decoration: decoration.copyWith(
                      hintText: "Email", labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
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
                child: TextField(
                  obscureText: true,
                  decoration: decoration.copyWith(
                      hintText: "Password", labelText: "Password"),
                  keyboardType: TextInputType.visiblePassword,
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
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (name == null ||
                          phoneNo == null ||
                          email == null ||
                          password == null) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Please, fill all the details before proceeding."),
                          ),
                        );
                      } else {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          print(userCredential);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegistrationScreen(
                                    uid: userCredential.user.uid.toString(),
                                    email:
                                        userCredential.user.email.toString());
                              },
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Enter a strong password.")));
                          } else if (e.code == 'email-already-in-use') {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "The account already exists for that mail.\nTry different email account or use Login page.")));
                          }
                        } catch (e) {
                          print(e);
                        }
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
    );
  }
}
