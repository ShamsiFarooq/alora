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
          "1. How many hours do you want...?",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        NumberContainer()

        // NumberContainer(),

        // Padding(
        //   padding: const EdgeInsets.only(left: 25),
        //   child: Column(
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           width15,
        //       //     GestureDetector(
        //       //       onTap: () {
        //       //         setState(() {
        //       //           iscolor = false;
        //       //         });
        //       //       },
        //       //       child: NumberContainer(
        //       //         color: color(context),
        //       //         number: '2',
        //       //       ),
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '3',
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '4',
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       number: '5',
        //       //       color: color2,
        //       //     ),
        //       //   ],
        //       // ),
        //       height15,
        //       // Row(
        //       //   crossAxisAlignment: CrossAxisAlignment.start,
        //       //   children: const [
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '6',
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '7',
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '8',
        //       //     ),
        //       //     width15,
        //       //     NumberContainer(
        //       //       color: color2,
        //       //       number: '9',
        //       //     ),
        //       //   ],
        //       // ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  // color(BuildContext context) {
  //   if (iscolor == true)
  //     return color2;
  //   else
  //     return color5;
  // }
}
