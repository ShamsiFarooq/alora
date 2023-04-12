import 'package:alora/screens/payment/payment.dart';
import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Amount :",
          style: TextStyle(
            color: color5,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Payment();
                },
              ),
            );
          },
          child: Container(
            width: 100,
            height: 30,
            color: color2,
            alignment: Alignment.center,
            child: const Text(
              '100',
            ),
          ),
        )
      ],
    );
  }
}
