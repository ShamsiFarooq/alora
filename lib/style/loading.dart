import 'package:alora/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitChasingDots(
        color: color3,
        size: 50,
      ),
    );
  }
}
