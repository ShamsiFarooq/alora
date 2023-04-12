import 'package:alora/style/constant.dart';
import 'package:flutter/material.dart';

class NumberContainer extends StatelessWidget {
  final String number;

  const NumberContainer({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: color2,
        radius: 18,
        child: Text(
          number,
          style: const TextStyle(color: color5),
        ),
      ),
    );
  }
}
