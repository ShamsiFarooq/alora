import 'package:alora/view/authentication/authenticate/login/login_screen.dart';
import 'package:alora/view/authentication/authenticate/signUp/screen_signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return ScreenLogin(toggleView: toggleView);
    } else {
      return ScreenSignUp(toggleView: toggleView);
    }
  }
}
