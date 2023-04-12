import 'package:alora/screens/login/components/body.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: color1,
        body: BodyLogin(),
      ),
    );
  }
}
