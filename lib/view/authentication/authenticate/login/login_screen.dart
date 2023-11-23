import 'package:alora/services/auth/auth_service.dart';
import 'package:alora/services/auth/google_sign_in_provider.dart';
import 'package:alora/view/authentication/authenticate/login/terms_use.dart';
import 'package:alora/view/authentication/authenticate/signUp/component/or_divoder.dart';
import 'package:alora/view/authentication/wrapper.dart';
import 'package:alora/view/components/already_have_an_account_check.dart';
import 'package:alora/view/components/rounded_button.dart';
import 'package:alora/view/components/text_field_container.dart';
import 'package:alora/view/style/loading.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
        ? const Loading()
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
                        height: size.height * 0.28,
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
                      height15,
                      RoundedButton(
                        text: 'LOGIN',
                        color: color3,
                        press: () async {
                          loginMethod();
                        },
                      ),
                      height15,
                      AlreadyAccountCheck(
                        press: () {
                          widget.toggleView();
                        },
                      ),
                      const OrDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.78,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(color2)),
                              onPressed: () async {
                                final provider =
                                    Provider.of<GoogleSignInProveder>(context,
                                        listen: false);
                                await provider.googleLogin().then((value) {
                                  return Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Wrapper()));
                                });
                              },
                              child: const Text(
                                'Google Sign In',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          // SocialIcon(
                          //   iconSrc: 'lib/assets/svg/google-plus.svg',
                          //   press: () async {},
                          // ),
                        ],
                      ),
                      TermsOfUse(),
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
