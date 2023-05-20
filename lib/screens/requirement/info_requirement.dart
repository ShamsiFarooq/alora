import 'dart:developer';

import 'package:alora/firebase/requirement.dart';
import 'package:alora/screens/requirement/functions.dart';
import 'package:alora/screens/requirement/location/add_location.dart';
import 'package:alora/screens/requirement/components/hours_section.dart';
import 'package:alora/screens/requirement/components/number_of_proffesionals.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

dynamic hours = 0;
int professionals = 0;
String cleaningType = "";
String dateAndTime = "";
String location = "";

class UserRequirementScreen extends StatelessWidget {
  const UserRequirementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          backgroundColor: color5,
          title: Text("Requirements"),
        ),
        // body: CategoryScreen(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                height15,
                const HoursSection(),
                const NumberOfProfessionalsWidget(),
                typeOfCleaning(),
                height15,
                DateTimePic(),
                height15,
                AddLocation(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        log(location);
                        // await RequirementAdd().addFromClient(hours,
                        //     professionals, cleaningType, dateAndTime, location);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Submit Request',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
