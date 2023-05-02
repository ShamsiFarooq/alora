import 'package:alora/screens/components/NumberContainer.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class HoursSection extends StatelessWidget {
  const HoursSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "1. How many hours do you want...?",
          style: TextStyle(
            fontSize: 18,
            color: color5,
            fontWeight: FontWeight.bold,
          ),
        ),
        height15,
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  width15,
                  NumberContainer(
                    number: '2',
                  ),
                  width15,
                  NumberContainer(
                    number: '3',
                  ),
                  width15,
                  NumberContainer(
                    number: '4',
                  ),
                  width15,
                  NumberContainer(
                    number: '5',
                  ),
                ],
              ),
              height15,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  width15,
                  NumberContainer(
                    number: '6',
                  ),
                  width15,
                  NumberContainer(
                    number: '7',
                  ),
                  width15,
                  NumberContainer(
                    number: '8',
                  ),
                  width15,
                  NumberContainer(
                    number: '9',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
