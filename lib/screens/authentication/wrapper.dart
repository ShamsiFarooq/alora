import 'package:alora/model/user_firbase.dart';
import 'package:alora/screens/authentication/authenticate.dart';
import 'package:alora/screens/authentication/authenticate/login/login_screen.dart';
import 'package:alora/screens/bottomnav/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // final users = Provider.of<Users?>(context);
    var users = FirebaseAuth.instance.currentUser;

    print(users);

    if (users == null) {
      return Authenticate();
    } else {
      return BottomNavBar();
    }
  }
}
