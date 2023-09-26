import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: DesignSystem.colors.appPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(0, 60),
        elevation: 0,
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routes.signUp);
      },
      child: Text(
        "60초 회원가입",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: DesignSystem.textStyle.bold.fontWeight,
        ),
      ),
    );
  }
}
