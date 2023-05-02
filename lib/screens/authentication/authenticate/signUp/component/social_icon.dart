import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function() press;
  const SocialIcon({
    super.key,
    required this.iconSrc,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: color2,
              ),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              iconSrc,
              height: 20,
              width: 20,
              color: Color.fromARGB(255, 196, 24, 15),
            ),
          ),
          Text(
            "<- sign in with google",
            style: TextStyle(
              color: color3,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
