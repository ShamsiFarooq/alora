import 'package:alora/screens/requirement/components/hours_section.dart';
import 'package:alora/screens/requirement/components/number_of_proffesionals.dart';
import 'package:alora/screens/requirement/components/payment_section.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class UserRequirementScreen extends StatelessWidget {
  const UserRequirementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          backgroundColor: color3,
        ),
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
                datePickerSection(context),
                const SizedBox(
                  height: 20,
                ),
                const PaymentSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column typeOfCleaning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "3. Wich type of cleaning do want...?",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              selectionOfCLeaningType(color: color3, name: 'Normal Cleaning'),
              const SizedBox(
                width: 10,
              ),
              selectionOfCLeaningType(
                name: 'Deep Cleaning',
                color: color2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column datePickerSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "4. Please select the date",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ElevatedButton(
                onPressed: () {
                  DateTime? date = datePicker(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Date picker',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            height15,
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ElevatedButton selectionOfCLeaningType(
      {required String name, required Color color}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
      ),
      child: Text(name),
    );
  }

  datePicker(BuildContext context) async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2035));
  }
}
