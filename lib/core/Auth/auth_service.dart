import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> SignIn(String email, String password) async {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
