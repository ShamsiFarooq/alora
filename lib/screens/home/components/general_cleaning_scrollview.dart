import 'package:alora/screens/home/components/cleaning_type.dart';
import 'package:alora/style/style.dart';
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
          top: 20,
        ),
        child: Row(
          children: const [
            ScrollCard(
              color: color4,
              title: "Villa Cleaning/",
              subTitle: " Flat cleanig",
            ),
            ScrollCard(
              color: color2,
              title: "Moving in/",
              subTitle: "Moving out",
            ),
            ScrollCard(
              color: color5,
              title: "Office",
              subTitle: "Cleaning",
            ),
            ScrollCard(
              color: color3,
              title: "After party",
              subTitle: "Cleaning",
            ),
            ScrollCard(
              color: color2,
              title: "Maintenance",
              subTitle: "Cleaning",
            ),
          ],
        ),
      ),
    );
  }
}
