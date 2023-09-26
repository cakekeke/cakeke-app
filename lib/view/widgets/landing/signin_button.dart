import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(0, 60),
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routes.signIn);
      },
      child: Text(
        "로그인",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: DesignSystem.textStyle.bold.fontWeight,
        ),
      ),
    );
  }
}
