import 'package:alora/screens/authentication/authenticate.dart';
import 'package:alora/screens/authentication/authenticate/signUp/screen_signup.dart';
import 'package:alora/screens/components/already_have_an_account_check.dart';
import 'package:alora/screens/components/round_input_field.dart';
import 'package:alora/screens/components/rounded_button.dart';
import 'package:alora/screens/components/rounded_password_field.dart';
import 'package:alora/screens/components/text_field_container.dart';
import 'package:alora/services/auth_service.dart';
import 'package:alora/style/loading.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenLogin extends StatefulWidget {
  final Function toggleView;

  ScreenLogin({
    super.key,
    required this.toggleView,
  });

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: color1,
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                      TextFieldContainer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color5),
                            ),
                            hintText: "user name",
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
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14),
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
                        text: 'LOGIN',
                        color: color3,
                        press: () async {
                          print(email);
                          loginMethod();
                        },
                      ),
                      height15,
                      AlreadyAccountCheck(
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ScreenSignUp(toggleView:,);
                          //     },
                          //   ),
                          // );
                          widget.toggleView();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void loginMethod() async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          error = "couldn't sign with these details";
          loading = false;
        });
      }
    }
  }
}
