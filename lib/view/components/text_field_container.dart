import 'package:alora/view/style/style.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.75,
      height: size.height * 0.065,
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
