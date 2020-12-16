import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:shubhwed/models/user.dart';
import 'package:shubhwed/models/gift.dart';
import 'package:shubhwed/models/guest.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<users> getUsers(String id) async {
    var snap = await _db.collection('users').doc(id).get();

    return users.fromMap(snap.data());
  }

  /// Get a stream of a single document
  Stream<users> streamUser(String id) {
    return _db
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => users.fromMap(snap.data()) );
  }

  /// Query a subcollection
  Stream<List<gift>> streamgifts(User user) {
    var ref = _db.collection('users').doc(user.uid).collection('giftList');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => gift.fromFirestore(doc)).toList());
  }

  Future<void> addUser(User user) {
    return _db
        .collection('users')
        .doc(user.uid)
        .set({'name': 'DogMan ${user.uid.substring(0,5)}'});
  }

  Future<void> addgift(User user, dynamic gift) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('giftList')
        .add(gift);
  }

  Future<void> removegift(User user, String id) {
    return _db
        .collection('users')
        .doc(user.uid)
        .collection('giftList')
        .doc(id)
        .delete();
  }
}