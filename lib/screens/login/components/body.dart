import 'package:alora/screens/components/already_have_an_account_check.dart';
import 'package:alora/screens/components/round_input_field.dart';
import 'package:alora/screens/components/rounded_button.dart';
import 'package:alora/screens/components/rounded_password_field.dart';
import 'package:alora/screens/signup/screen_signup.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color5,
              fontSize: 20,
            ),
          ),
          SvgPicture.asset(
            "lib/assets/svg/login.svg",
            height: size.height * 0.35,
          ),
          height15,
          RoundedInputField(
            hintText: 'user name',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'LOGIN',
            color: color3,
            press: () {},
          ),
          height15,
          AlreadyAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ScreenSignUp();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
