import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class newStream extends StatefulWidget {
  Map<String, dynamic> data;
  newStream(this.data);
  @override
  _newStreamState createState() => _newStreamState();
}

class _newStreamState extends State<newStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.data['uid'])
          .collection('giftList')
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Text('PLease Wait')
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 8.0),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot giftSnapshot = snapshot.data.documents[index];
                  Map<String,dynamic> gift=giftSnapshot.data();
                  print(gift);

                  return Text("$gift");
                },
              );
      },
    );
  }
}
