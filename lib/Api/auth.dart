import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salamtak_university_project/Api/databaseApi.dart';
import 'package:salamtak_university_project/model/User.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthServices extends ChangeNotifier {
  FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;

  UserF? _userFromFirebaseUser(User user) {
    return user != null ? UserF(user.uid) : null;
  }

  Status get status => _status;
  User? get user => _user;

  AuthServices.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      var result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = result.user;
      return true; 
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup(String email, String password, String fullName, String address,
      String age) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user!;

      await DatabaseApi(uid: authResult.user!.uid)
          .addUser(fullName, address, age);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      return null;
    }
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
