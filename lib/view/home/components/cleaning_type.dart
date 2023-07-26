import 'package:alora/view/requirement/info_requirement.dart';
import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class ScrollCard extends StatelessWidget {
  final Color color;
  final String title;
  final String image;
  ScrollCard({
    super.key,
    required this.color,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const UserRequirementScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: color,
              width: 3,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              height15,
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
