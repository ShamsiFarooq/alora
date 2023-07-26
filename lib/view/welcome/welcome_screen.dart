import 'package:alora/view/welcome/components/body.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Body(),
    );
  }
}
