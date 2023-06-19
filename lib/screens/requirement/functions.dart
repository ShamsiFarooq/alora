import 'dart:developer';

import 'package:alora/screens/requirement/components/type_of_cleaning.dart';
import 'package:alora/screens/requirement/info_requirement.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

Column typeOfCleaning() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "5. Wich type of cleaning do want...?",
        style: TextStyle(
          fontSize: 18,
          color: color5,
          fontWeight: FontWeight.bold,
        ),
      ),
      height15,
      TypeOfCleaning(),
    ],
  );
}

class DateTimePic extends StatefulWidget {
  const DateTimePic({super.key});

  @override
  State<DateTimePic> createState() => _DateTimePicState();
}

class _DateTimePicState extends State<DateTimePic> {
  DateTime dateTime = DateTime(2023, 12, 24, 0, 00);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "7. Please select the date and time",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ElevatedButton(
                onPressed: pickDayTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "${dateTime.day}/${dateTime.month}/${dateTime.year}  ${dateTime.hour} : ${dateTime.minute} ",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<TimeOfDay?> picTime() {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
  }

  Future pickDayTime() async {
    DateTime? date = await datePicker(context);
    if (date == null) return;
    TimeOfDay? time = await picTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    dateAndTime = dateTime.toString();
    //log(dateAndTime);
    setState(() {
      this.dateTime = dateTime;
    });
  }
}

Future<DateTime?> datePicker(BuildContext context) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2035));
}
