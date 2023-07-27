import 'package:alora/view/authentication/wrapper.dart';
import 'package:alora/view/home/components/general_cleaning_scrollview.dart';
import 'package:alora/view/home/components/other_service_view.dart';
import 'package:alora/services/auth/auth_service.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color2,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: color2,
          automaticallyImplyLeading: false,
          title: const Text(
            "ALORA",
            style: TextStyle(
              color: color5,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await _auth.signOut().then((value) {
                    return Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Wrapper()));
                  });

                  // await FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color1,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'SignOut',
                  style: TextStyle(
                    color: color5,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 8,
            right: 8,
          ),
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Text(
                    "General Cleaning",
                    style: TextStyle(
                      fontSize: 22,
                      color: color5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const GeneralCleaningScrollView(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: const OtherServiceView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
