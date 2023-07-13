import 'package:alora/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProveder extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Get the signed-in user details
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser?.uid;
    final displayName = currentUser?.displayName;
    final email = currentUser?.email;
    final googleId = currentUser?.uid; // Use the same ID as uid for simplicity

    // Add user data to the database
    final databaseService = DatabaseServices(uid: uid);
    await databaseService.addUserData(
      name: displayName,
      email: email,
    );

    notifyListeners();
  }
}
