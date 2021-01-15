import 'package:flutter/material.dart';
//import 'package:shubhwed_web/screens/homePage.dart';
import 'screens/homePage.dart';
import 'screens/new.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import "package:shubhwed_web/screens/new.dart";


class GetUserName extends StatelessWidget {
  String documentId;
  GetUserName(this.documentId);



 

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId.substring(1)).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
         
          Map<String, dynamic> data = snapshot.data.data();
     
          return Scaffold(body: HomePage(data),backgroundColor:  Colors.red[100].withOpacity(0.2),);
        }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}