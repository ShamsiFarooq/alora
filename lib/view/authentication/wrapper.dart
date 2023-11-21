import 'package:alora/view/authentication/authenticate.dart';
import 'package:alora/view/bottomnav/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or some placeholder widget
          return CircularProgressIndicator();
        } else {
          var user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            return Authenticate();
          } else {
            return BottomNavBar();
          }
        }
      },
    );
  }
}
