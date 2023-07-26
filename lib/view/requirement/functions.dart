import 'package:alora/view/requirement/components/type_of_cleaning.dart';
import 'package:alora/view/requirement/info_requirement.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  backgroundColor: lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "${_formatDateTime(dateTime)}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: color5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<TimeOfDay?> pickTime() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
    );
  }

  Future pickDayTime() async {
    DateTime? date = await datePicker(context);
    if (date == null) return;
    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      this.dateTime = dateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    final String formattedTime = DateFormat('hh:mm a').format(dateTime);
    dateTo = formattedDate;
    timeTo = formattedTime;
    return '$formattedDate  $formattedTime';
  }
}

String _formatDateTime(DateTime dateTime) {
  final String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  final String formattedTime = DateFormat('hh:mm a').format(dateTime);
  return '$formattedDate  $formattedTime';
}

Future<DateTime?> datePicker(BuildContext context) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2035));
}
