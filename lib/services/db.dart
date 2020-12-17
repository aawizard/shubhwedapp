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

  Stream<List<guest>> streamguest() {
    var ref = userCollection.doc(uid).collection('guestList');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => guest.fromFirestore(doc)).toList());
  }


  Future<void> addUser(User user) {
    return userCollection
        .doc(user.uid)
        .set({'name': 'DogMan ${user.uid.substring(0,5)}'});
  }

  Future<void> addgift(User user, dynamic gift) {
    return userCollection
        .doc(user.uid)
        .collection('giftList')
        .add(gift);
  }

  Future<void> removegift(User user, String id) {
    return userCollection
        .doc(user.uid)
        .collection('giftList')
        .doc(id)
        .delete();
  }
}