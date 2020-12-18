import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:shubhwed/models/user.dart';
import 'package:shubhwed/models/gift.dart';
import 'package:shubhwed/models/guest.dart';

class DatabaseService {
 final String uid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  DatabaseService(this.uid);

  Future<users> getUsers(String id) async {
    var snap = await userCollection.doc(id).get();

    return users.fromMap(snap.data());
  }

  /// Get a stream of a single document
  Stream<users> streamUser(String id) {
    return userCollection.doc(id)
        .snapshots()
        .map((snap) => users.fromMap(snap.data()) );
  }

  //Query a subcollection   giftList
  Stream<List<Gift>> streamgifts() {
    var ref = userCollection.doc(uid).collection('giftList');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => Gift.fromFirestore(doc)).toList());
  }
//Query a subcollection   giftList
  Stream<List<Guest>> streamguest() {
    var ref = userCollection.doc(uid).collection('guestList');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => Guest.fromFirestore(doc)).toList());
  }


  Future<void> addUser(dynamic user) {
    return userCollection
        .doc(user.uid)
        .set(user);
  }

  Future<void> addgift( dynamic gift) {
    return userCollection
        .doc(uid)
        .collection('giftList')
        .add(gift);
  }

  Future<void> addguest( dynamic guest) {
    return userCollection
        .doc(uid)
        .collection('guestList')
        .add(guest);
  }


  Future<void> removegift( String id) {
    return userCollection
        .doc(uid)
        .collection('giftList')
        .doc(id)
        .delete();
  }

  Future<void> removeguest( String id) {
    print('$uid      $id');
    return userCollection
        .doc(uid)
        .collection('guestList')
        .doc(id)
        .delete();
  }

}

