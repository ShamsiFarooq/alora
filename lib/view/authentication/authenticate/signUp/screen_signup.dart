import 'package:alora/view/authentication/authenticate/signUp/component/background.dart';
import 'package:alora/view/components/already_have_an_account_check.dart';
import 'package:alora/view/components/rounded_button.dart';
import 'package:alora/view/components/text_field_container.dart';
import 'package:alora/services/auth/auth_service.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenSignUp extends StatefulWidget {
  final Function toggleView;
  const ScreenSignUp({super.key, required this.toggleView});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: color1,
          body: Background(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'SIGN UP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: color5),
                    ),
                    height15,
                    SvgPicture.asset(
                      "lib/assets/svg/signup.svg",
                      height: size.height * 0.35,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color5),
                          ),
                          hintText: "Name",
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value!.length < 3 ? "enter real name" : null,
                        onChanged: (value) {
                          setState(() => name = value);
                        },
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color5),
                          ),
                          hintText: "Enter email",
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value!.length < 6 ? "enter 6 letter long" : null,
                        onChanged: (value) {
                          setState(() => email = value);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 55,
                        ),
                        Text(
                          error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ],
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color5),
                          ),
                          hintText: "password",
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value!.length < 6 ? "enter 6 letter long" : null,
                        onChanged: (value) {
                          setState(() => password = value);
                        },
                      ),
                    ),
                    RoundedButton(
                      text: "SIGN UP",
                      color: color5,
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result =
                              await _auth.signUpWithEmailAndPassword(
                                  email, password, name);
                          if (result == null) {
                            setState(() => error = 'pleas give a valid email');
                          }
                        }
                      },
                    ),
                    height15,
                    AlreadyAccountCheck(
                      login: false,
                      press: () {
                        widget.toggleView();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}