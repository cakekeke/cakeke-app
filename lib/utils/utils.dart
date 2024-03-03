import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 2000),
      content: Text(text),
    ));
  }

  static bool validateId(String id) {
    return RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$").hasMatch(id) &&
        id.length >= 8;
  }
}
