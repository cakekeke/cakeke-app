import 'package:flutter/material.dart';

class StoreFilter extends StatelessWidget {
  const StoreFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "서울시",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.expand_more,
                size: 24,
              )
            ],
          ),
          SizedBox(width: 8),
          Row(
            children: [
              Text(
                "강남구",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.expand_more,
                size: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
