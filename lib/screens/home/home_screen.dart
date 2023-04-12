import 'package:alora/screens/home/components/general_cleaning_scrollview.dart';
import 'package:alora/screens/home/components/other_service_view.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: color3,
          title: const Text(
            "ALORA",
            style: TextStyle(
              color: color5,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
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
                  top: 30,
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
              GeneralCleaningScrollView(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: OtherServiceView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
