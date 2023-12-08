import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset(
      'assets/images/icon_custom_tutorial_tab.svg',
    ));
  }
}
