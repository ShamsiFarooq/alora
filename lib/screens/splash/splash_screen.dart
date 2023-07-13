import 'package:alora/screens/authentication/wrapper.dart';
import 'package:alora/screens/splash/splash_functions.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: logoImage(),
        duration: 3000,
        nextScreen: const Wrapper(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: color2,
      ),
    );
  }
}
