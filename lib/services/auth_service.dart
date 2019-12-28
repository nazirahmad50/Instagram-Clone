import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screens/feed_screen.dart';

class AuthService {

  static final _auth =
      FirebaseAuth.instance; // comunicate with firebase auth sdk
  static final _firestore = Firestore.instance;

  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedUser = authResult.user; // AuthResult will hold the user after creation

      // user returned
      if (signedUser != null) {
        // set the data in firestore
        _firestore
            .collection("/users")
            .document(signedUser.uid)
            .setData({"name": name, "email": email, "profileImageUrl": ""});

        // go to feed screen after user successfuly logges in
        Navigator.pushReplacementNamed(context, FeedScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }
}
