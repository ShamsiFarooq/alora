import 'package:alora/screens/components/NumberContainer.dart';
import 'package:alora/screens/requirement/info_requirement.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class HoursSection extends StatefulWidget {
  const HoursSection({
    super.key,
  });

  @override
  State<HoursSection> createState() => _HoursSectionState();
}

class _HoursSectionState extends State<HoursSection> {
  bool iscolor = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "3. How many hours do you want...?",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        NumberContainer()
      ],
    );
  }
}
