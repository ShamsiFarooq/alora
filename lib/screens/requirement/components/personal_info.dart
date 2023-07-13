import 'package:alora/screens/requirement/info_requirement.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerContact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // contactName = name;
    // contactNumber = number;
    print(contactName);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "1. Enter your name",
          style: TextStyle(
            color: color5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(top: 3, left: 10),
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(29),
          ),
          child: TextFormField(
            controller: controllerName,
            onChanged: (value) {
              setState(() {
                contactName = value;

                // Update contactName when the text changes
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        const Text(
          "2. Enter your contact number",
          style: TextStyle(
            color: color5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(top: 3, left: 10),
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(29),
          ),
          child: TextFormField(
            controller: controllerContact,
            onChanged: (value) {
              setState(() {
                contactNumber =
                    value; // Update contactNumber when the text changes
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
