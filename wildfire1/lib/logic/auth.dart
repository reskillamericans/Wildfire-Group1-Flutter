import 'package:firebase_auth/firebase_auth.dart';
import 'package:wildfire1/utils/failure.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signUp({String? email, String? password}) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Failure(message: "This email address is already registered");
      }
      throw Failure(message: e.toString());
    }
  }

  Future<UserCredential> logIn({String? email, String? password}) async {
    try {
      final user =
          auth.signInWithEmailAndPassword(email: email!, password: password!);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Failure(message: "This email address has not been registered");
      } else if (e.code == 'wrong-password') {
        throw Failure(message: "Password is incorrect");
      }
      throw Failure(message: e.toString());
    }
  }
}
