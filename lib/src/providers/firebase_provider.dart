import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/screen/Pages/appPages.dart';
import 'package:myapp/src/screen//MainScreens/login.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email,
        required String password,
        required BuildContext context,
      }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password);

      ///uid alıp doc key'i olarak kullanmak.
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("UloginLog").doc(uid).set(
        {
          'Email': email,
         'isLoggedIn': true,
          'lastLoginDate': FieldValue.serverTimestamp(),
      },
       SetOptions(merge: true),
      );

      print("Signed In");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppPages(),
        ),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password, required BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
        password: password,);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }
}