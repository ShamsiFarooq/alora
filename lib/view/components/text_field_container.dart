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
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      width: size.width * 0.78,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
