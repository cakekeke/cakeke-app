import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/landing-logo.png",
      width: 251,
      height: 190,
    );
  }
}
