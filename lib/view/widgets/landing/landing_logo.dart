import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      width: 240,
      height: 88,
    );
  }
}
