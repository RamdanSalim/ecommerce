import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  Future<User?> login(String email, String password) async {
    UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return credential.user;
  }
}
