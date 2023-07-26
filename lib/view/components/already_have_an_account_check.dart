import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class AlreadyAccountCheck extends StatelessWidget {
  final bool login;
  final Function()? press;
  const AlreadyAccountCheck({
    super.key,
    this.login = true,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Dont't have an Account ?" : "Already have an Account ?",
          style: TextStyle(
            color: color3,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(color: color3, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
