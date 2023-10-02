import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeLocationButton extends StatelessWidget {
  const HomeLocationButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: DesignSystem.colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 10,
                  )
                ]),
            child: Icon(
              Icons.my_location,
              color: DesignSystem.colors.black,
            )));
  }
}
