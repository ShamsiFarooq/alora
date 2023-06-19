import 'dart:developer';
import 'package:alora/firebase/requirement.dart';
import 'package:alora/screens/history/history.dart';
import 'package:alora/screens/requirement/components/personal_info.dart';
import 'package:alora/screens/requirement/functions.dart';
import 'package:alora/screens/requirement/location/add_location.dart';
import 'package:alora/screens/requirement/components/hours_section.dart';
import 'package:alora/screens/requirement/components/number_of_proffesionals.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

dynamic hours = 0;
int professionals = 0;
String cleaningType = "";
String dateAndTime = "";
String location = "";
String contactName = "";
String contactNumber = "";

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
                PersonalInfo(),
                height15,
                const HoursSection(),
                height15,
                const NumberOfProfessionalsWidget(),
                typeOfCleaning(),
                height15,
                DateTimePic(),
                height15,
                AddLocation(),
                height15,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await RequirementAdd().addFromClient(
                          userId,
                          hours,
                          professionals,
                          cleaningType,
                          dateAndTime,
                          location,
                          contactName,
                          contactNumber,
                        );

                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Request Completed Successfully!',
                        );
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryScreen(
                              userId: userId,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("GO to Order Page"),
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
