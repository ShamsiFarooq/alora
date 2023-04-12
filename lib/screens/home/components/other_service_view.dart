import 'package:alora/screens/home/components/other_service_card.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class OtherServiceView extends StatelessWidget {
  const OtherServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Other Services",
          style: TextStyle(
            fontSize: 22,
            color: color5,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
                childAspectRatio: 1.30,
                children: const [
                  OtherServiceCard(
                    image: "lib/assets/img/Facility-services.jpg",
                    name: "Facility Management",
                  ),
                  OtherServiceCard(
                    image: "lib/assets/img/buuilding_maintance.webp",
                    name: "Building Maintenance",
                  ),
                  OtherServiceCard(
                    image: "lib/assets/img/human_resource.jpeg",
                    name: "Oversease Recruitment",
                  ),
                  OtherServiceCard(
                    image: "lib/assets/img/general_cleaning.webp",
                    name: "General Cleaning",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
