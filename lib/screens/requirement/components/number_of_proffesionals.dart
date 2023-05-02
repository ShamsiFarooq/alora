import 'package:alora/screens/components/NumberContainer.dart';
import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';

class NumberOfProfessionalsWidget extends StatelessWidget {
  const NumberOfProfessionalsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "2. How many professional do you want...?",
              style: TextStyle(
                fontSize: 18,
                color: color5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        height15,
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NumberContainer(
                    number: '1',
                  ),
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
                ],
              ),
              height15,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NumberContainer(
                    number: '5',
                  ),
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
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
