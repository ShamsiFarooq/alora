import 'package:flutter/material.dart';

const color1 = Color(0xFFEDFAFD);
const color2 = Color(0xFFAED9DA);
const color3 = Color(0xFF3DDAD7);
const color4 = Color(0xFF2A93D5);
const color5 = Color(0xFF135589);

const SizedBox height15 = SizedBox(height: 15);
const SizedBox width15 = SizedBox(width: 15);

appBarLogo() {
  return AppBar(
    backgroundColor: color5,
    leading: Container(
      padding: const EdgeInsets.only(left: 5),
      child: Image.asset(
        'lib/assets/img/logo.jpeg',
      ),
    ),
  );
}
