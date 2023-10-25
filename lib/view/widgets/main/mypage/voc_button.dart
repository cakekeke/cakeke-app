import 'package:flutter/material.dart';

class VOCButton extends StatelessWidget {
  const VOCButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffF3F3F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(0, 44),
        elevation: 0,
      ),
      onPressed: () {},
      child: const Text(
        "VOC",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xff373737),
        ),
      ),
    );
  }
}
