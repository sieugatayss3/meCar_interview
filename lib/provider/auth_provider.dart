import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AppState { initial, authenticated, authenticating, unauthenticated }

class AuthService with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  AppState _appState = AppState.initial;

  AppState get appState => _appState;
  User get user => _user;

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((firebaseUser) {
      print('listem ===> $firebaseUser');
      if (firebaseUser == null) {
        _appState = AppState.unauthenticated;
      } else {
        _user = firebaseUser;
        _appState = AppState.authenticated;
      }

      notifyListeners();
    });
  }

  Future<bool> createUserWithEmailAndPassword(
      {String password, String email}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _appState = AppState.authenticated;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(
      {String password, String email}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _appState = AppState.authenticated;
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      notifyListeners();
      return false;
    }
  }

  logout() async {
    await _auth.signOut();
    _appState = AppState.unauthenticated;
    notifyListeners();
  }
}
