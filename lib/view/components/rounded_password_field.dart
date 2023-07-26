import 'package:alora/view/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  final controller;

  RoundedPasswordField({
    super.key,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.grey,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
