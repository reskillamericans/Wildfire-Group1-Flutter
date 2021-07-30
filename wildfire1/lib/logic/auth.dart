import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wildfire1/utils/failure.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signUp({String? email, String? password}) async {
    try {
      final user = auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return user;
    } on FirebaseAuthException {
      throw Failure(message: "Registration Failed");
    } on SocketException {
      throw Failure(message: "No internet connection");
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<UserCredential> logIn({String? email, String? password}) async {
    try {
      final user =
          auth.signInWithEmailAndPassword(email: email!, password: password!);
      return user;
    } on FirebaseAuthException {
      throw Failure(message: "Registration Failed");
    } on SocketException {
      throw Failure(message: "No internet connection");
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
