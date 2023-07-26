import 'package:alora/view/home/components/cleaning_type.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class GeneralCleaningScrollView extends StatelessWidget {
  const GeneralCleaningScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 10,
        ),
        child: Row(
          children: [
            ScrollCard(
              color: color3,
              title: "Flat/Villa Cleaning",
              image: 'lib/assets/img/villacleaning.jpeg',
            ),
            ScrollCard(
              color: color3,
              title: "Moving in/out",
              image: 'lib/assets/img/moveinout.jpeg',
            ),
            ScrollCard(
              color: color3,
              title: "Office Cleaning",
              image: 'lib/assets/img/officeclean.webp',
            ),
            ScrollCard(
              color: color3,
              title: "After party Cleaning",
              image: 'lib/assets/img/afterparty.jpeg',
            ),
            ScrollCard(
              color: color3,
              title: "Maintenance Cleaning",
              image: 'lib/assets/img/maintenance.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
