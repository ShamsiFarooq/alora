import 'package:alora/screens/bottomnav/bottom_navigation.dart';
import 'package:alora/screens/components/already_have_an_account_check.dart';
import 'package:alora/screens/components/round_input_field.dart';
import 'package:alora/screens/components/rounded_button.dart';
import 'package:alora/screens/components/rounded_password_field.dart';
import 'package:alora/screens/home/home_screen.dart';
import 'package:alora/screens/login/login_screen.dart';
import 'package:alora/screens/signUp/component/background.dart';
import 'package:alora/screens/signUp/component/or_divoder.dart';
import 'package:alora/screens/signUp/component/social_icon.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'SIGN UP',
              style: TextStyle(fontWeight: FontWeight.bold, color: color5),
            ),
            height15,
            SvgPicture.asset(
              "lib/assets/svg/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              color: color5,
              press: () {},
            ),
            height15,
            AlreadyAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ScreenLogin();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'lib/assets/svg/facebook.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'lib/assets/svg/google-plus.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'lib/assets/svg/twitter.svg',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BottomNavBar();
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
