import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference newStartUp =
      FirebaseFirestore.instance.collection('newstartup');

  Future<void> addUserData(String name, String email, int counter) async {
    await newStartUp.doc(uid).set({
      'name': name,
      'email': email,
      'counter': counter,
    });
  }

  Future<void> getUserData(String name, String email, int counter) async {
    var docSnapshot = await newStartUp.doc('$uid').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data();
      counter = data['counter'];
      name = data['name'];
      email = data['email'];

      return [counter, name, email];
    }
  }
}
