import 'package:cloud_firestore/cloud_firestore.dart';

class Guest{
  final String id;
  final String name;
  final bool invitationStatus;
  final String imageURL;
  final int guestNumber;
  final String phoneNo;
  final String email;
  final String gift;
  final String message;
  final bool RSVPstatus;


  Guest( {this.id,this.name, this.invitationStatus, this.imageURL, this.guestNumber, this.phoneNo, this.email, this.gift,this.message, this.RSVPstatus,});
  factory Guest.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
  return Guest(
    id: doc.id,
    name: data['name']??'',
    invitationStatus: data['invitationStatus']??false,
    imageURL: data['imageURL']??'',
    guestNumber: data['guestNumber']??1,
    phoneNo: data['phoneNo']??'',
    email: data['email']??'',
    gift: data['gift']??'',
    message: data['message']??'',
    RSVPstatus: data['RSVPStatus']??false,
  );
  }

}