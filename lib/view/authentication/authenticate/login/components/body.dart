import 'package:alora/services/auth/auth_service.dart';
import 'package:alora/view/components/already_have_an_account_check.dart';
import 'package:alora/view/components/round_input_field.dart';
import 'package:alora/view/components/rounded_button.dart';
import 'package:alora/view/components/rounded_password_field.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyLogin extends StatefulWidget {
  BodyLogin({
    super.key,
  });

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  // ignore: unused_field
  final AuthServices _auth = AuthServices();

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
          const Text(
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
            press: () async {
              // dynamic result = await _auth.signInAnon();
              // if (result == null) {
              //   print('error sign in');
              // } else {
              //   print('sign in');
              //   print(result.uid);
              // }
            },
          ),
          height15,
          AlreadyAccountCheck(
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return ScreenSignUp();
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
