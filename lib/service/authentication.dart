import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:interview_task/service/database.dart';

class ProviderState extends ChangeNotifier {
  String _uid;
  String _email;
  String _name;
  int _counter = 0;

  String get getUid => _uid;
  String get getEmail => _email;
  String get getName => _name;
  int get getCount => _counter;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password, String name) async {
    bool retval = false;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      //
      DatabaseService(uid: userCredential.user.uid)
          .addUserData(name, email, _counter);

      if (userCredential.user != null) {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        _name = name;
        _counter = _counter;

        return retval = true;
      }
    } catch (e) {
      print(e);
    }

    return retval;
  }

  Future<bool> loginUser(String email, String password, String name) async {
    bool retval = false;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      DatabaseService(uid: userCredential.user.uid)
          .getUserData(name, email, _counter);

      if (userCredential.user != null) {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        _name = _name;
        _counter = _counter;
        return retval = true;
      }
    } catch (e) {
      print(e);
    }

    return retval;
  }
}
