import 'package:alora/screens/login/login_screen.dart';
import 'package:alora/screens/signUp/screen_signup.dart';
import 'package:alora/screens/welcome/components/background.dart';
import 'package:alora/screens/components/rounded_button.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to ALORA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "lib/assets/svg/chat.svg",
              height: size.height * 0.44,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenLogin()));
              },
              color: color3,
            ),
            RoundedButton(
              text: 'SIGN UP',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenSignUp()));
              },
              color: color2,
            ),
          ],
        ),
      ),
    );
  }
}
