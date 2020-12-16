import 'package:cloud_firestore/cloud_firestore.dart';

class guest{
  final String id;
  final String name;
  final bool invitationStatus;
  final String imageURL;
  final int guestNumber;
  final String phoneNo;
  final String email;
  final String gift;

  guest({this.id,this.name, this.invitationStatus, this.imageURL, this.guestNumber, this.phoneNo, this.email, this.gift});
  factory guest.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
  return guest(
    id: doc.id,
    name: data['name']??'',
    invitationStatus: data['invitationStatus']??false,
    imageURL: data['imageURL']??'',
    guestNumber: data['guestNumber']??'',
    phoneNo: data['phoneNo']??'',
    email: data['email']??'',
    gift: data['gift']??'',
  );
  }

}