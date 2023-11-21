// ignore_for_file: use_build_context_synchronously

import 'package:alora/services/database.dart';
import 'package:alora/view/history/history.dart';
import 'package:alora/view/requirement/components/personal_info.dart';
import 'package:alora/view/requirement/functions.dart';
import 'package:alora/view/requirement/location/add_location.dart';
import 'package:alora/view/requirement/components/hours_section.dart';
import 'package:alora/view/requirement/components/number_of_proffesionals.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

dynamic hours = 0;
int professionals = 0;
String cleaningType = "";
String dateTo = "";
String timeTo = "";
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
          title: const Text("Requirements"),
          centerTitle: true,
        ),
        // body: CategoryScreen(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                height15,
                const PersonalInfo(),
                height15,
                const HoursSection(),
                height15,
                const NumberOfProfessionalsWidget(),
                typeOfCleaning(),
                height15,
                const DateTimePic(),
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
                        await DatabaseServices().addUserRequirement(
                          userId,
                          hours,
                          professionals,
                          cleaningType,
                          dateTo,
                          timeTo,
                          location,
                          contactName,
                          contactNumber,
                        );

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Request Completed Successfully!',
                                style: TextStyle(
                                  color: color3,
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: color3,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color5,
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
                        backgroundColor: color5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Go to Order Page"),
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
