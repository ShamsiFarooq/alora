import 'package:alora/screens/requirement/info_requirement.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class ScrollCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subTitle;
  const ScrollCard(
      {super.key,
      required this.color,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserRequirementScreen();
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.only(left: 20),
        height: 120,
        width: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color1,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: color1,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
