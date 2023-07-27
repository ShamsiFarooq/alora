import 'package:alora/view/authentication/authenticate.dart';
import 'package:alora/view/bottomnav/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<Users?>(context);
    var users = FirebaseAuth.instance.currentUser;

    print("UID  : ${users?.uid}");

    if (users == null) {
      return const Authenticate();
    } else {
      return const BottomNavBar();
    }
  }
}